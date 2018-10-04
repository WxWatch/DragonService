import XCTest
@testable import DragonService

final class RealmTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        DragonService.RegionConstants.allCases.forEach {
            let expectation = XCTestExpectation(description: "Realms \($0)")
            DragonService.Realm().list(region: $0, completionHandler: { (realms) in
                XCTAssertNotNil(realms)
                expectation.fulfill()
            }, errorHandler: { (error) in
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
