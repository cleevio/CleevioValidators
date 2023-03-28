//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation

/// Validates a collection to ensure it has a minimum number of elements.
public struct MinimumCollectionCountValidator<CollectionType: Collection>: ValidatorType {
    
    /// An error enum for easy handling of validation errors.
    public enum ValidatorError: LocalizedError {
        
        /// Validation failed: the collection does not have enough elements.
        case notLongEnough
        
        /// Validation failed: the collection is empty.
        case empty
    }

    /// The minimum number of elements that the collection must have.
    public let minimumItems: UInt

    /**
     Initializes a new `MinimumCollectionCountValidator` with a minimum number of elements.
     
     - Parameter minimumItems: The minimum number of elements that the collection must have.
     */
    public init(minimumItems: UInt) {
        self.minimumItems = minimumItems
    }
    
    /**
     Validates the provided collection and returns an error if it doesn't meet the minimum length requirement or is empty.
     
     - Parameter collection: The collection to validate.
     
     - Returns: An error of type `ValidatorError.notLongEnough` if the collection does not have enough elements, an error of type `ValidatorError.empty` if the collection is empty, otherwise `nil`.
     */
    public func validate(content collection: CollectionType) -> ValidatorError? {
        guard collection.count >= minimumItems else {
            return collection.isEmpty ? .empty : .notLongEnough
        }

        return nil
    }
}

public extension MinimumCollectionCountValidator {
    
    /**
     Initializes a new `MinimumCollectionCountValidator` with a minimum number of elements.
     
     - Parameter minimumItems: The minimum number of elements that the collection must have.
     */
    init(minimumItems: Int) {
        self.init(minimumItems: UInt(minimumItems))
    }
}
