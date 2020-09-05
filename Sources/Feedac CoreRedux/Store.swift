//
//  State.swift
//  
//
//  Created by Marius Ilie on 05/09/2020.
//

import Foundation
import SwiftUI
import Combine

fileprivate let asyncMiddleware: Middleware<State> = { dispatcher, state in
    return { next in
        return {
            if let action = $0 as? AsyncAction {
                action.async(on: state(), dispatch: dispatcher)
            }
            return next($0)
        }
    }
}

final public class Store<S: State>: ObservableObject {
    private var dispatcher: Dispatcher!
    private let reducer: Reducer<S>
    
    @Published public var state: S
    
    public init(_ state: S, using reducer: @escaping Reducer<S>, intercept middlewares: [Middleware<S>] = []) {
        self.reducer = reducer
        self.state = state
        
        var middlewares = middlewares
        middlewares.append(asyncMiddleware)
        self.dispatcher = middlewares
            .reversed()
            .reduce({ [unowned self] in
                self.computeState(for: $0)
            }, { disparcher, middleware in
                middleware({ [weak self] in
                    self?.dispatch(action: $0)
                }, { [weak self] in
                    self?.state
                })(disparcher)
            })
    }

    public func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.dispatcher(action)
        }
    }
    
    private func computeState(for action: Action) {
        state = reducer(state, action)
    }
}
