//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation
import CleevioValidators

final class MinimumCharactersValidatorTests: ValidatorTests<MinimumCharactersValidator> {
    func testLongEnoughString() {
        sut = MinimumCharactersValidator(minimumCharacters: 5)
        expectedResult = nil

        validate(content: "GreatText")
    }

    func testNotLongEnoughString() {
        sut = MinimumCharactersValidator(minimumCharacters: 6)
        expectedResult = .notLongEnough

        validate(content: "Short")
    }

    func testEmptyString() {
        sut = MinimumCharactersValidator(minimumCharacters: 6)
        expectedResult = .empty

        validate(content: "")
    }

    func testWhitespaceString() {
        sut = MinimumCharactersValidator(minimumCharacters: 6)
        expectedResult = .empty

        validate(content: "     ")
    }

    func testWhitespaceStringShort() {
        sut = MinimumCharactersValidator(minimumCharacters: 6)
        expectedResult = .empty

        validate(content: "   ")
    }
    
    func testZeroLimit() {
        sut = MinimumCharactersValidator(minimumCharacters: 0)
        expectedResult = nil

        validate(content: "Test")
    }
}
