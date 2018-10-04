import XCTest
@testable import DragonService

final class LanguageTests: BaseTestCase {
    func testList() {
        let expectation = XCTestExpectation(description: "Language")
        DragonService.Language().list(completionHandler: { (languages) in
            XCTAssertNotNil(languages)
            expectation.fulfill()
        }, errorHandler: { (error) in
            XCTAssertNil(error)
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 15.0)
    }

    func testGet() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Language \(version)")
            DragonService.Language().get(version: version, locale: locale, completionHandler: { (language) in
                XCTAssertNotNil(language)
                expectation.fulfill()
            }, errorHandler: { (error) in
                if version == "7.4.2" { // 7.4.2 just doesn't exist in DDragon for some reason
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
        ("testGet", testGet)
    ]
}
