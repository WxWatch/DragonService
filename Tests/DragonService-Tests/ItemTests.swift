import XCTest
@testable import DragonService

final class ItemTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Items \(version)")
            DragonService.Item().list(version: version, locale: locale, completionHandler: { (items) in
                XCTAssertNotNil(items)
                expectation.fulfill()
            }, errorHandler: { (error) in
                print(version)
                XCTAssertNil(error)
                expectation.fulfill()
            })
            expectations.append(expectation)
        }

        wait(for: expectations, timeout: 600)
    }

    static var allTests = [
        ("testList", testList),
    ]
}
