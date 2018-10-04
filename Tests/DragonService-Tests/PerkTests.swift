import XCTest
@testable import DragonService

final class PerkTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Perks \(version)")
            DragonService.Perk().list(version: version, locale: locale, completionHandler: { (perks) in
                XCTAssertNotNil(perks)
                expectation.fulfill()
            }, errorHandler: { (error) in
                if version.isVersion(lessThan: "7.22.1") {
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
