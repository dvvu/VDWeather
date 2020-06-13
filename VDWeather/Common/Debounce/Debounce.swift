//
//  Debounce.swift
//  VDWeather
//
//  Created by Vu Doan on 6/11/20.
//  Copyright © 2020 Vu Doan. All rights reserved.
//

import Foundation

class Debounce<T: Equatable> {
    private init() {}
    static func input(_ input: T,
                      comparedAgainst current: @escaping @autoclosure () -> (T),
                      perform: @escaping (T) -> ()) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if input == current() { perform(input) }
        }
    }
}
