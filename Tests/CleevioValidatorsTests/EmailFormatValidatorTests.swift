//
//  Copyright 2023 © Cleevio s.r.o. All rights reserved.
//

import Foundation
import CleevioValidators

final class EmailFormatValidatorTests: ValidatorTests<EmailFormatValidator> {
    override func setUp() {
        sut = .init()
    }

    func testEmptyAddress() {
        expectedResult = .empty

        validate(content: "")
    }

    func testValidEmailAddresses() {
        Self.validEmailAddresses.forEach { validate(content: $0) }
    }

    func testInvalidEmailAddress() {
        expectedResult = .incorrectFormat

        Self.invalidEmailAddresses.forEach { validate(content: $0) }
    }

    func testValidEmailsWithWhiteSpaces() {
        expectedResult = .incorrectFormat

        Self.emailsWithWhitespaces.forEach { validate(content: $0) }
    }

    
    func testWhitespaceString() {
        expectedResult = .empty
        
        validate(content: "     ")
        validate(content: " ")
    }

    func testInvalidAddressesContainingEmail() {
        expectedResult = .incorrectFormat

        Self.invalidEmailAddressesContainingEmail.forEach { validate(content: $0) }
    }

    func testWebURL() {
        expectedResult = .incorrectFormat

        validate(content: "cleevio.com")
    }

    func testName() {
        expectedResult = .incorrectFormat

        validate(content: "Lukáš Valenta")
    }

    func testDiacriticEmail() {
        expectedResult = nil

        validate(content: "lukáš.valenta@cleevio.com")
    }
}

extension EmailFormatValidatorTests {
    static let validEmailAddresses: [String] = [
        "correct@email.com",
        "correct.email@email.com",
        "corectemail2@example.com",
        "correct1@email.com",
        "correct@email2.com",
        "correct+email@example.com",
        "correct.email@example.com",
        "correct@email.email.com",
        "correct@correct-email.com",
        "correct@correct.correct-email.cz"
    ]

    static let invalidEmailAddresses: [String] = [
        "plainaddress",
        "#@%^%#$@#$@#.com",
        "@example.com",
        "email.example.com",
        "email.@example.com",
        "あいうえお@example.com",
        "email@example",
        "email@-example.com",
        "email@111.222.333.44444",
        "email@example..com"
    ]

    static let emailsWithWhitespaces: [String] = [
        " correct@email.com",
        "correct.email @email.com",
        "corectemail2@example .com",
        "correct1@email.com ",
        " correct@email2.com ",
        "correct +email@example.com",
        "correct. email@example.com"
    ]

    static let invalidEmailAddressesContainingEmail: [String] = [
        "Joe Smith <email@example.com>",
        "email@example@example.com",
        ".email@example.com",
        "email..email@example.com",
        "email@example.com (Joe Smith)",
        "Abc..123@example.com"
    ]
}
