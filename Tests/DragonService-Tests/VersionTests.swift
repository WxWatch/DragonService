import XCTest
@testable import DragonService

final class VersionTests: BaseTestCase {
    func testList() {
        let expectation = XCTestExpectation(description: "Version")
        DragonService.Version().list { (versions) in
            XCTAssertNotNil(versions)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 15.0)
    }

    static var allTests = [
        ("testList", testList)
    ]
}
