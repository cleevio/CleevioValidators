//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation

/**
 A protocol for defining a type that can validate contents of a certain type.
 
 Use a type that conforms to `ValidatorType` to define validation rules for a specific type of content, and check if the content meets the requirements of those rules.
 */
public protocol ValidatorType<ValidatorError> {
    
    /**
     The error type used by the validator to denote validation failures.
    */
    associatedtype ValidatorError: ValidatedError
    
    /**
     The type of content that is being validated.
    */
    associatedtype ValidatedContent
    
    /**
     Validates the provided content and returns an error, if any.
     
     - Parameter content: The content to be validated.
     - Returns: An error of type `ValidatorError` if the content does not meet the validation rules, otherwise `nil`.
     - The function does not throw the error to provide better API to work with – because the expected usage is that the validator may contain other validators.
     - For example, this is how SignInValidator can look like:
     ```
     struct SignInValidator: ValidatorType {
         typealias PasswordValidator = MinimumCharactersValidator

         let emailFormatValidator = EmailFormatValidator()
         let passwordValidator = PasswordValidator(minimumCharacters: 8)
         
         struct ValidatedContent {
             let email: String
             let password: String
         }
         
         struct ValidatorError: LocalizedError, Equatable {
             init?(
                 emailError: EmailFormatValidator.ValidatorError?,
                 passwordError: SignInValidator.PasswordValidator.ValidatorError?
             ) {
                 guard emailError != nil || passwordError != nil else { return nil }

                 self.emailError = emailError
                 self.passwordError = passwordError
             }
             
             let emailError: EmailFormatValidator.ValidatorError?
             let passwordError: PasswordValidator.ValidatorError?
         }

         func validate(content: ValidatedContent) -> ValidatorError? {
             let emailError = emailFormatValidator.validate(content: content.email)
             let passwordError = passwordValidator.validate(content: content.password)

             return ValidatorError(
                 emailError: emailError,
                 passwordError: passwordError
             )
         }
     }
     ```
     */
    func validate(content: ValidatedContent) -> ValidatorError?
}

/**
 A protocol representing an error type for validation failures.
 
 Types conforming to `ValidatedError` are used to denote validation failures in the context of the `ValidatorType` protocol.
 */
public protocol ValidatedError: LocalizedError, Equatable {
    /// A boolean value indicating whether the error represents a successfully validated state.
    var isValidated: Bool { get }
}

public extension ValidatedError {
    var isValidated: Bool { false }
}

public extension Optional<ValidatedError> {
    /// A boolean value indicating whether the error represents a successfully validated state.
    var isValidated: Bool {
        self?.isValidated ?? true
    }
}
