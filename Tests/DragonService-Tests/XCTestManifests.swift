import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(dragon_serviceTests.allTests),
    ]
}
#endif