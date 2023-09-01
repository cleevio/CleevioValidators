//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation

/// Validates a boolean value to ensure it matches an expected value.
public struct BoolValidator: ValidatorType {

    /// An error enum for easy handling of validation errors.
    public enum ValidatorError: ValidatedError {
        
        /// Validation failed: boolean value is different from the expected value.
        case differentToExpectedValue
    }
    
    /// The boolean value that is expected to match.
    public let expectedValue: Bool

    /**
     Initializes a new `BoolValidator` with an expected boolean value.
     
     - Parameter expectedValue: The boolean value to compare against during validation.
     */
    public init(expectedValue: Bool) {
        self.expectedValue = expectedValue
    }
    
    /**
     Validates the provided boolean value and returns an error if it doesn't match the expected value.
     
     - Parameter bool: The boolean value to validate.
     
     - Returns: An error of type `ValidatorError.differentToExpectedValue` if `bool` and `expectedValue` do not match, otherwise `nil`.
     */
    public func validate(content bool: Bool) -> ValidatorError? {
        guard bool == expectedValue else { return .differentToExpectedValue }
        
        return nil
    }
}
