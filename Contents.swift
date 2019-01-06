import UIKit

class Solution {
    public func strongPasswordChecker(_ s: String) -> Int {
        
        // Properties
        
        
        // Scenarios that indicate a valid password.
        var longEnough: Bool = false
        var shortEnough: Bool = false
        var containsLower: Bool = false
        var containsUpper: Bool = false
        var containsDigit: Bool = false
        
        // Integers for counting.
        var requiredChanges: Int = 0
        var totalRepetitions: Int = 0
        
        
        
        
        // 1) Check the length of the string
        
        
        if s.count <= 5 {
            return 6 - s.count
        }
        
        if s.count >= 6 {
            // String is at least 6 characters long.
            longEnough = true
        } else {
            // String is too short.
            requiredChanges += (6 - s.count)
        }
        
        if s.count <= 20 {
            // String is at least less than 20 characters long.
            shortEnough = true
        } else {
            // String is too long.
            requiredChanges += (s.count - 20)
        }
        
        
        
        
        // 2) Check for lowercase, uppercase, and digit characters
        
        
        for char in s {
            if char >= "0" && char <= "9" {
            // Character is a digit.
                containsDigit = true
            } else {
            // Character is not a digit.
                // Check if character is lower or upper case.
                let str = String(char)
                if str == str.lowercased() {
                    containsLower = true
                } else if str == str.uppercased() {
                    containsUpper = true
                }
            }
        }
        
        if !containsLower {
            requiredChanges += 1
        }
        if !containsUpper {
            requiredChanges += 1
        }
        if !containsDigit {
            requiredChanges += 1
        }
        
        
        
        
        // 3) Check for repeating characters
        
        
        var repetitions = 0
        var prevChar: Character = s[s.startIndex]
        for char in s {
            if totalRepetitions >= 6 {
            // Exceeded maximum amount of repetition replacements.
                break
            }
            
            if char == prevChar {
                repetitions += 1
            } else {
                prevChar = char
                repetitions = 1
                continue
            }
            
            if repetitions >= 3 {
                requiredChanges += 1
                totalRepetitions += 1
                repetitions = 1
            }
            
            prevChar = char
        }
        
        
        
        
        // End) Adjust the output value if necessary
        
        
        if totalRepetitions > 0 {
            if !containsLower {
                requiredChanges -= 1
            }
            if !containsUpper {
                requiredChanges -= 1
            }
            if !containsDigit {
                requiredChanges -= 1
            }
            
            if containsLower && containsUpper && !containsDigit {
                if !longEnough {
                    requiredChanges -= 1
                }
                if !shortEnough {
                    requiredChanges -= 1
                }
            }
            
            if containsUpper && containsLower && !containsDigit {
                if !longEnough {
                    requiredChanges -= 1
                }
                if !shortEnough {
                    requiredChanges -= 1
                }
            }
            
            if containsDigit && containsLower && !containsUpper {
                if !longEnough {
                    requiredChanges -= 1
                }
                if !shortEnough {
                    requiredChanges -= 1
                }
            }
            
            if containsLower && containsUpper && containsDigit {
                if !longEnough {
                    requiredChanges -= 3
                }
                if !shortEnough {
                    requiredChanges -= 3
                }
            }
        }
        
        return requiredChanges
    }
}




// MARK: Unit Tests


let testCases: [String : Int] = [
    "" : 6,
    "a" : 5,
    "aa" : 4,
    "aaa" : 3,
    "aaaa" : 2,
    "aaaB" : 2,
    "aaa23" : 1,
    "aa123" : 1,
    "aaa111" : 2,
    "aaa123" : 1,
    "aaAA11" : 0,
    "1111111111" : 3,
    "aaa1@gmail.com!" : 1,
    "oCaptainMyCapta1n!" : 0,
    "111111111111111111111111111111111111111111111111111111111111111111" : 52,
    "111a11111111111111111111111111111111111111111111111111111111111111" : 51,
    "111a1111111111111111111bb11111111111C11111111111111111111111111111" : 49
]

var passCount = 0
var failCount = 0
var failures: [String] = []

let start = CFAbsoluteTimeGetCurrent()

for test in testCases {
    let input = test.key
    let output = Solution().strongPasswordChecker(input)
    let expected = test.value
    
    if output == expected {
        passCount += 1
    } else {
        failCount += 1
        failures.append("""
            Input:      "\(input)"
            Output:     \(output)
            Expected:   \(expected)\n
        """)
    }
}

let diff = CFAbsoluteTimeGetCurrent() - start
let rounded = Double(round(1000 * diff)/1000)
print("""
\(testCases.count) tests completed in \(rounded) seconds.
\(passCount) passed, \(failCount) failed.\n
""")

if failures.count > 0 {
    print("""
    --------------------
        Failed Tests
    --------------------
    """)
    
    for failure in failures {
        print(failure)
    }
}
