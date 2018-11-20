import XCTest
@testable import DragonService

final class MapTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Maps \(version)")
            DragonService.Map().list(version: version, locale: locale, completionHandler: { (maps) in
                XCTAssertNotNil(maps)
                expectation.fulfill()
            }, errorHandler: { (error) in
                if version.isVersion(lessThan: "5.5.3") {
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
