/*
 * Game of Apps summer development internship pre-interview assignment 2
 * Raymond Liu
 * May 2019
 *
 * Question 1 (findPairs): Create a function that accepts an array of integers and a target sum.
 *
 */

import Foundation
import UIKit

extension Array {
    // Remove and return first element if it exists, otherwise return nil
    mutating func popFirst() -> Element? {
        if count > 0 {
            return removeFirst()
        } else {
            return nil
        }
    }
}

func findPairs(in array: [Int], withSum sum: Int) {
    var pairs: [(Int, Int)] = []
    
    // Sort array and remove duplicates
    var sortedArray = Set(array).sorted()
    
    var smallestElement: Int? = sortedArray.popFirst()
    var largestElement: Int? = sortedArray.popLast()
    
    // While another test pair exists in the array
    while smallestElement != nil && largestElement != nil {
        // Get test pair: smallest and largest element
        guard let smallestElem = smallestElement, let largestElem = largestElement else {
            break
        }
        
        if smallestElem + largestElem == sum {
            pairs.append((smallestElem, largestElem))
            // Correct test pair: change both smallest and largest elements
            smallestElement = sortedArray.popFirst()
            largestElement = sortedArray.popLast()
        } else if smallestElem + largestElem > sum {
            // Sum too large: decrease largest element
            largestElement = sortedArray.popLast()
        } else if smallestElem + largestElem < sum {
            // Sum too small: increase smallest element
            smallestElement = sortedArray.popFirst()
        }
    }
    
    // Edge case: check for pair (sum/2, sum/2)
    if sum % 2 == 0 {
        let halfSumArray = array.filter { $0 == sum/2}
        if halfSumArray.count >= 2 {
            pairs.append((sum/2, sum/2))
        }
    }
    
    // Print pairs
    for pair in pairs {
        print("(\(pair.0), \(pair.1))")
    }
}


var testArray: [Int] = [], targetSum = 0

// Test case 1
testArray = [2, 4, 5, 1, 3, 5, 4, -1, 7, -333, 339, 3]
targetSum = 6
print("Case 1: the pairs are: ")
findPairs(in: testArray, withSum: targetSum)
print()

// Test case 2
testArray = [-1, 1, 0]
targetSum = 0
print("Case 2: the pairs are: ")
findPairs(in: testArray, withSum: targetSum)
print()
