import XCTest
@testable import DragonService

final class ChampionTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Champions \(version)")
            DragonService.Champion().list(version: version, locale: locale, completionHandler: { (champions) in
                XCTAssertNotNil(champions)
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

    func testFullList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Champions Full \(version)")
            DragonService.Champion().list(version: version, locale: locale, full: true, completionHandler: { (champions) in
                XCTAssertNotNil(champions)
                expectation.fulfill()
            }, errorHandler: { (error) in
                if version.isVersion(lessThanOrEqualTo: "3.6.15") {
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
        ("testList", testList),
        ("testFullList", testFullList)
    ]
}
