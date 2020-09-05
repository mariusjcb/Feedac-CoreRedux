//
//  File.swift
//  
//
//  Created by Marius Ilie on 05/09/2020.
//

import Foundation

public typealias Middleware<S> = (@escaping Dispatcher, @escaping () -> State?) -> ((@escaping Dispatcher) -> Dispatcher)
