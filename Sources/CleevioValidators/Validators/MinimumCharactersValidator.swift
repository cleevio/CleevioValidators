//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation

/// Validates text to ensure that it is at least a certain number of characters long.
public struct MinimumCharactersValidator: ValidatorType {
    
    /// An error enum for easy handling of validation errors.
    public enum ValidatorError: ValidatedError {
        
        /// Validation failed: text is empty.
        case empty
        
        /// Validation failed: text is too short.
        case notLongEnough
    }

    /// The minimum number of characters required for validation to succeed.
    public let minimumCharacters: UInt

    /**
     Initializes a new `MinimumCharactersValidator` with the provided minimum number of characters.
     
     - Parameter minimumCharacters: The minimum number of characters required for validation to succeed.
     */
    public init(minimumCharacters: UInt) {
        self.minimumCharacters = minimumCharacters
    }
    
    /**
     Validates the provided text and returns an error if it doesn't meet the validation rules.
     
     - Parameter text: The text to be validated.
     
     - Returns: An error of type `ValidatorError` if the `text` does not meet the validation rules, otherwise `nil`.
     */
    public func validate(content text: String) -> ValidatorError? {
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return .empty }

        guard text.count >= minimumCharacters else { return .notLongEnough }

        return nil
    }
}

public extension MinimumCharactersValidator {
    
    /**
     Initializes a new `MinimumCharactersValidator` with the provided minimum number of characters.
     
     This initializer accepts an `Int` as a convenience that automatically converts to a `UInt`.
     
     - Parameter minimumCharacters: The minimum number of characters required for validation to succeed.
     */
    init(minimumCharacters: Int) {
        self.init(minimumCharacters: UInt(minimumCharacters))
    }
}
