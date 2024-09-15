<p align="center">
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat"></a>
<a href="blob/main/LICENSE.md"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"></a>
</p>

# CleevioValidators

CleevioValidators is a Swift package that provides a collection of reusable validators to validate various types of content and the validator interface.

## Features

CleevioValidators includes the following validators:

- `BoolValidator`: validates if a value is an expected boolean
- `EmailFormatValidator`: validates if a value is a valid email format.
- `MinimumCharactersValidator`: validates if a string has a minimum number of characters.
- `MinimumCollectionCountValidator`: validates if a collection has a minimum number of items.
- `NonNilValidator`: validates if a value is not nil.

All validators implement the `ValidatorType` protocol, which defines a `validate` method that takes a value of any type and returns am optional error indicating whether the value is valid or not.

In addition, you can create custom validators by conforming to the `ValidatorType` protocol and implementing the `validate` method. This allows you to create validators specific to your project's needs.

The library is fully documented and fully covered by tests.

## Installation

### Swift Package Manager
Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

Xcode 11+ is required to build CleevioValidators iOS Logger using Swift Package Manager.

To integrate CleevioValidators into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```
dependencies: [
    .package(url: "https://github.com/cleevio/CleevioValidators.git", .upToNextMajor(from: "0.2.0"))
]
```

## Contributing

Contributions to CleevioValidators are welcome!
Here are a few ways you can contribute:

- Add new validators for different types of content
- Improve validation logic in existing validators
- Improve documentation and examples
- Fix bugs or issues

If you'd like to contribute, create a new branch for your work. Once you're finished, create a merge request and we'll review your changes.

## Developed by

The good guys from [Cleevio](https://cleevio.com).

![Cleevio logo](assets/cleevio.png)
