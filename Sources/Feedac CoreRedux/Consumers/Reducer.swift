//
//  Reducer.swift
//  
//
//  Created by Marius Ilie on 05/09/2020.
//

import Foundation

public typealias Reducer<StateRepresentable> = (_ state: StateRepresentable, _ action: Action) -> StateRepresentable
