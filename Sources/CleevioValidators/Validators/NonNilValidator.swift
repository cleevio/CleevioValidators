//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation

/// Validates that the provided content is not nil.
public struct NonNilValidator: ValidatorType {
    
    /// An error enum for easy handling of validation errors.
    public enum ValidatorError: ValidatedError {
        
        /// Validation failed: the content is nil.
        case empty
    }
    
    /**
     Initializes a new `NonNilValidator`.
     */
    public init() { }

    /**
     Validates the provided content and returns an error if it is nil.
     
     - Parameter content: The content to validate.
     
     - Returns: An error of type `ValidatorError.empty` if the content is nil, otherwise `nil`.
     */
    public func validate(content: Any?) -> ValidatorError? {
        return content == nil ? .empty : nil
    }
}
