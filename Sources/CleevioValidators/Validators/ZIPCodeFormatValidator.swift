//
//  File.swift
//  CleevioValidators
//
//  Created by Matěj Simota on 16.10.2025.
//

import Foundation

/// Validates an email address to ensure it is in a correct format.
public struct ZIPCodeFormatValidator: ValidatorType {

    /// An error enum for easy handling of validation errors.
    public enum ValidatorError: ValidatedError {

        /// Validation failed: ZIP code is empty.
        case empty

        /// Validation failed: ZIP code has an incorrect format.
        case incorrectFormat
    }

    /**
     Initializes a new `ZIPCodeFormatValidator`.
     */
    public init() { }
    
    /**
     Validates the provided email address and returns an error if it doesn't meet the validation rules.
     
     - Parameter email: The email address to be validated.

     - Returns: An error of type `ValidatorError` if the `email` does not meet the validation rules, otherwise `nil`.
     */
    public func validate(content zipCode: String) -> ValidatorError? {
        guard !zipCode.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return .empty
        }
        // This regex allows:
        // - Letters, digits, spaces, and hyphens
        // - Between 3 and 12 characters
        // Covers formats like: "12345", "12345-6789", "SW1A 1AA", "75008", "100-0001", etc.
        let zipRegex = #"^[A-Za-z0-9\s\-]{3,12}$"#
        let zipPredicate = NSPredicate(format: "SELF MATCHES %@", zipRegex)
        return zipPredicate.evaluate(with: zipCode) ? nil : .incorrectFormat
    }
}
