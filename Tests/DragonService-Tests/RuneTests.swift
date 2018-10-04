import XCTest
@testable import DragonService

final class RuneTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Runes \(version)")
            DragonService.Rune().list(version: version, locale: locale, completionHandler: { (runes) in
                XCTAssertNotNil(runes)
                expectation.fulfill()
            }, errorHandler: { (error) in
                if version.isVersion(greaterThanOrEqualTo: "7.24.1") {
                    XCTAssertNotNil(error)
                } else {
                    print(version)
                    XCTAssertNil(error)
                }
                expectation.fulfill()
            })
            expectations.append(expectation)
        }

        wait(for: expectations, timeout: 600)
    }

    static var allTests = [
        ("testList", testList)
    ]
}
