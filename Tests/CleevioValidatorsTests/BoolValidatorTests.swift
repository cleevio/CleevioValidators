//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation
import CleevioValidators

final class BoolValidatorTests: ValidatorTests<BoolValidator> {
    func testExpectedTrue() {
        sut = BoolValidator(expectedValue: true)
        expectedResult = nil

        validate(content: true)
    }

    func testExpectedFalse() {
        sut = BoolValidator(expectedValue: false)
        expectedResult = nil

        validate(content: false)
    }

    func testExpectedTrueGivenFalse() {
        sut = BoolValidator(expectedValue: false)
        expectedResult = .differentToExpectedValue

        validate(content: true)
    }

    func testExpectedFalseGivenTrue() {
        sut = BoolValidator(expectedValue: true)
        expectedResult = .differentToExpectedValue

        validate(content: false)
    }
}
