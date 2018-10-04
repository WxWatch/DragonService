import XCTest
@testable import DragonService

final class SummonerSpellTests: BaseTestCase {
    func testList() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Summoner Spells \(version)")
            DragonService.SummonerSpell().list(version: version, locale: locale, completionHandler: { (summonerSpells) in
                XCTAssertNotNil(summonerSpells)
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
