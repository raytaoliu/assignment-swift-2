/*
 * Game of Apps summer development internship pre-interview assignment 2
 * Raymond Liu
 * May 2019
 *
 * Question 2 (isPalindrome): Create a function that checks if a string is a palindrome
 */

import Foundation

func isPalindrome(_ word: String) -> Bool {
    let chars = Array(word)
    
    for i in 0..<chars.count/2 {
        if chars[i] != chars[chars.count - 1 - i] {
            return false
        }
    }
    
    return true
}

// Test case 1: abcdeba
print("Is 'abcdeba' a palindrome? \n\(isPalindrome("abcdeba")) \n")

// Test case 2: bobbob
print("Is 'bobbob' a palindrome? \n\(isPalindrome("bobbob")) \n")

// Test case 3: a
print("Is 'a' a palindrome? \n\(isPalindrome("a")) \n")
