import XCTest
@testable import DragonService

final class ProfileIconTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Profile Icons \(version)")
            DragonService.ProfileIcon().list(version: version, locale: locale, completionHandler: { (profileIcons) in
                XCTAssertNotNil(profileIcons)
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
        ("testList", testList)
    ]
}
