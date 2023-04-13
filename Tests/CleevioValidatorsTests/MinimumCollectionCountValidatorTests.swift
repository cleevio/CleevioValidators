//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation
import CleevioValidators
import XCTest

final class MinimumCollectionCountValidatorTests: XCTestCase {
    func testValidationSuccess() {
        // Given
        let validator = MinimumCollectionCountValidator<[String]>(minimumItems: 2)
        let content = ["item1", "item2", "item3"]

        // When
        let result = validator.validate(content: content)

        // Then
        XCTAssertNil(result, "Expected validation to succeed")
    }

    func testValidationFailureForEmptyCollection() {
        // Given
        let validator = MinimumCollectionCountValidator<[String]>(minimumItems: 1)
        let content = [String]()

        // When
        let result = validator.validate(content: content)

        // Then
        XCTAssertEqual(result, MinimumCollectionCountValidator.ValidatorError.empty, "Expected validation to fail due to empty collection")
    }

    func testValidationFailureForShortCollection() {
        // Given
        let validator = MinimumCollectionCountValidator<[String]>(minimumItems: 3)
        let content = ["item1", "item2"]

        // When
        let result = validator.validate(content: content)

        // Then
        XCTAssertEqual(result, MinimumCollectionCountValidator.ValidatorError.notLongEnough, "Expected validation to fail due to short collection")
    }

    func testInitializerWithInt() {
        // Given
        let minimumItems = 5

        // When
        let validator = MinimumCollectionCountValidator<[String]>(minimumItems: minimumItems)

        // Then
        XCTAssertEqual(validator.minimumItems, UInt(minimumItems), "Expected the minimumItems value to be converted to UInt")
    }
}
