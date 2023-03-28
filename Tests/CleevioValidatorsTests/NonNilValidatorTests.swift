//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation
import CleevioValidators
import XCTest

final class NonNilValidatorTests: XCTestCase {
    func testValidContent() {
        let sut = NonNilValidator()
        let validContent: String? = "Hello"
        let validationResult = sut.validate(content: validContent)
        XCTAssertNil(validationResult, "The content should be valid")
    }

    func testValidNonNilContent() {
        let sut = NonNilValidator()
        let validContent: String = "Hello"
        let validationResult = sut.validate(content: validContent)
        XCTAssertNil(validationResult, "The content should be valid")
    }

    func testInvalidContent() {
        let sut = NonNilValidator()
        let invalidContent: String? = nil
        let validationResult = sut.validate(content: invalidContent)
        XCTAssertEqual(validationResult, .empty, "The content should be invalid")
    }

    func testValidContentOfDifferentType() {
        let sut = NonNilValidator()
        let validContent: Int? = 42
        let validationResult = sut.validate(content: validContent)
        XCTAssertNil(validationResult, "The content should be valid")
    }

    func testInvalidContentOfDifferentType() {
        let sut = NonNilValidator()
        let invalidContent: Double? = nil
        let validationResult = sut.validate(content: invalidContent)
        XCTAssertEqual(validationResult, .empty, "The content should be invalid")
    }
}
