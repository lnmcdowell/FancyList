//
//  TestStub.swift
//  FancyListTests
//
//  Created by Larry Mcdowell on 2/27/21.
//

import Foundation

class TestStub {
    var total:Int = 0
    
    func addThese(first:Int, second:Int)->Int {
        total = first + second
        return total
    }
    
    func multiplyIt(first:Int, second:Int) -> Int {
        total = first * second
        return total
    }
}
