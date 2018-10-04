import XCTest
@testable import DragonService

final class MasteryTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Masteries \(version)")
            DragonService.Mastery().list(version: version, locale: locale, completionHandler: { (items) in
                XCTAssertNotNil(items)
                expectation.fulfill()
            }, errorHandler: { (error) in
                if version.isVersion(greaterThanOrEqualTo: "7.0.0") {
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
