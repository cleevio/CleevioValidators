//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation

/// Validates an email address to ensure it is in a correct format.
public struct EmailFormatValidator: ValidatorType {

    /// An error enum for easy handling of validation errors.
    public enum ValidatorError: LocalizedError {

        /// Validation failed: email is empty.
        case empty

        /// Validation failed: email has an incorrect format.
        case incorrectFormat
    }

    /**
     Initializes a new `EmailFormatValidator`.
     */
    public init() { }
    
    /**
     Validates the provided email address and returns an error if it doesn't meet the validation rules.
     
     - Parameter email: The email address to be validated.

     - Returns: An error of type `ValidatorError` if the `email` does not meet the validation rules, otherwise `nil`.
     */
    public func validate(content email: String) -> ValidatorError? {
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return .empty }
        guard !email.contains("..") else { return .incorrectFormat }
            
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let range = NSRange(location: 0, length: email.utf16.count)
        let matches = detector.matches(in: email, options: [], range: range)

        let matchExists = matches.first(where: { match in
            match.url?.scheme == "mailto" && match.range == range
        }) != nil
        
        return matchExists ? nil : .incorrectFormat
    }
}
