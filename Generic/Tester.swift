//
//  Tester.swift
//  Cards
//
//  Created by Matt Bamberger on 9/15/19.
//  Copyright © 2019 Marcus Bamberger. All rights reserved.
//

import Foundation


//------------------------------------------------------------------------------
// Tester
// Manages all our autotests.
//------------------------------------------------------------------------------
class Tester {
    var testsRun = 0            // How many tests have we run
    var errors = [(String, String, Int)]()     // All the error messages we've generated
    // String 1 covers the error message. String 2 covers the file path. Int covers the line number.
    
    //------------------------------------------------------------------------------
    // Initializer
    //------------------------------------------------------------------------------
    init() {
    }
    
    
    //------------------------------------------------------------------------------
    // test
    // Records the result of a single test.
    //------------------------------------------------------------------------------
    func test(_ result: Bool, msg: String = "", file: String = #file, line: Int = #line) {
        testsRun += 1
        if !result {
            errors.append((msg, file, line))
        }
    }
    
    
    //------------------------------------------------------------------------------
    // reportResults
    // We're done running tests. How did we do?
    //------------------------------------------------------------------------------
    func reportResults() {
        print("\n\n\nAutotests completed")
        
        if errors.count == 0 {
            print("\(testsRun) passed\n\n\n")
        } else {
            print("""
                ********************
                * \(errors.count) ERRORS
                *
                """)
            for error in errors {
                print("*\t\(error.0)")
                print("*\t\tLine \(error.2) of \(error.1)")
            }
            print("********************\n\n\n")
        }
    }
}
