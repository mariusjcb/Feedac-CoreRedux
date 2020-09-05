//
//  AsyncAction.swift
//  
//
//  Created by Marius Ilie on 05/09/2020.
//

import Foundation

public protocol AsyncAction: Action {
    func async(on state: State?, dispatch: @escaping Dispatcher)
}
