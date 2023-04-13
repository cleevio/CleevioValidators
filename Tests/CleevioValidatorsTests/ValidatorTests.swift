//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation
import XCTest
import CleevioValidators

class ValidatorTests<ValidatorType: CleevioValidators.ValidatorType>: XCTestCase {
    var sut: ValidatorType!
    var expectedResult: ValidatorType.ValidatorError?

    func validate(
        content: ValidatorType.ValidatedContent,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let validationResult = sut.validate(content: content)
        XCTAssertEqual(validationResult, expectedResult, "For content \(content)", file: file, line: line)
    }
}
