import XCTest
@testable import DragonService

final class dragon_serviceTests: XCTestCase {
    let locale = "en_US"

    let region = "NA"

    let versions = [
        "8.18.2",
        "8.18.1",
        "8.17.1",
        "8.16.1",
        "8.15.1",
        "8.14.1",
        "8.13.1",
        "8.12.1",
        "8.11.1",
        "8.10.1",
        "8.9.1",
        "8.8.2",
        "8.8.1",
        "8.7.1",
        "8.6.1",
        "8.5.2",
        "8.5.1",
        "8.4.1",
        "8.3.1",
        "8.2.1",
        "8.1.1",
        "7.24.2",
        "7.24.1",
        "7.23.1",
        "7.22.1",
        "7.21.1",
        "7.20.3",
        "7.20.2",
        "7.20.1",
        "7.19.1",
        "7.18.1",
        "7.17.2",
        "7.17.1",
        "7.16.1",
        "7.15.1",
        "7.14.1",
        "7.13.1",
        "7.12.1",
        "7.11.1",
        "7.10.1",
        "7.9.2",
        "7.9.1",
        "7.8.1",
        "7.7.1",
        "7.6.1",
        "7.5.2",
        "7.5.1",
        "7.4.3",
        "7.4.2",
        "7.4.1",
        "7.3.3",
        "7.3.2",
        "7.3.1",
        "7.2.1",
        "7.1.1",
        "6.24.1",
        "6.23.1",
        "6.22.1",
        "6.21.1",
        "6.20.1",
        "6.19.1",
        "6.18.1",
        "6.17.1",
        "6.16.2",
        "6.16.1",
        "6.15.1",
        "6.14.2",
        "6.14.1",
        "6.13.1",
        "6.12.1",
        "6.11.1",
        "6.10.1",
        "6.9.1",
        "6.8.1",
        "6.7.1",
        "6.6.1",
        "6.5.1",
        "6.4.2",
        "6.4.1",
        "6.3.1",
        "6.2.1",
        "6.1.1",
        "5.24.2",
        "5.24.1",
        "5.23.1",
        "5.22.3",
        "5.22.2",
        "5.22.1",
        "5.21.1",
        "5.20.1",
        "5.19.1",
        "5.18.1",
        "5.17.1",
        "5.16.1",
        "5.15.1",
        "5.14.1",
        "5.13.1",
        "5.12.1",
        "5.11.1",
        "5.10.1",
        "5.9.1",
        "5.8.1",
        "5.7.2",
        "5.7.1",
        "5.6.2",
        "5.6.1",
        "5.5.3",
        "5.5.2",
        "5.5.1",
        "5.4.1",
        "5.3.1",
        "5.2.2",
        "5.2.1",
        "5.1.2",
        "5.1.1",
        "4.21.5",
        "4.21.4",
        "4.21.3",
        "4.21.1",
        "4.20.2",
        "4.20.1",
        "4.19.3",
        "4.19.2",
        "4.18.1",
        "4.17.1",
        "4.16.1",
        "4.15.1",
        "4.14.2",
        "4.13.1",
        "4.12.2",
        "4.12.1",
        "4.11.3",
        "4.10.7",
        "4.10.2",
        "4.9.1",
        "4.8.3",
        "4.8.2",
        "4.8.1",
        "4.7.16",
        "4.7.9",
        "4.7.8",
        "4.6.3",
        "4.5.4",
        "4.4.3",
        "4.4.2",
        "4.3.18",
        "4.3.12",
        "4.3.10",
        "4.3.4",
        "4.3.2",
        "4.2.6",
        "4.2.5",
        "4.2.1",
        "4.1.43",
        "4.1.41",
        "4.1.13",
        "4.1.9",
        "4.1.2",
        "3.15.5",
        "3.15.4",
        "3.15.2",
        "3.14.41",
        "3.14.23",
        "3.14.22",
        "3.14.20",
        "3.14.19",
        "3.14.16",
        "3.14.13",
        "3.14.12",
        "3.13.24",
        "3.13.8",
        "3.13.6",
        "3.13.1",
        "3.12.37",
        "3.12.36",
        "3.12.34",
        "3.12.33",
        "3.12.26",
        "3.12.24",
        "3.12.2",
        "3.11.4",
        "3.11.2",
        "3.10.6",
        "3.10.3",
        "3.10.2",
        "3.9.7",
        "3.9.5",
        "3.9.4",
        "3.8.5",
        "3.8.3",
        "3.8.1",
        "3.7.9",
        "3.7.2",
        "3.7.1",
        "3.6.15",
        "3.6.14",
        "0.154.3",
        "0.154.2",
        "0.153.2",
        "0.152.115",
        "0.152.108",
        "0.152.107",
        "0.152.55",
        "0.151.101",
        "0.151.2"
    ]

    func testChampions() {
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

    func testChampions2() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Champions \(version)")
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

    func testItems() {
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

    func testLanguages() {
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

    func testLanguages2() {
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

    func testMasteries() {
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

    func testProfileIcons() {
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

    func testRealms() {
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

    func testRunes() {
        var expectations: [XCTestExpectation] = []
        for version in versions {
            let expectation = XCTestExpectation(description: "Runes \(version)")
            DragonService.Rune().list(version: version, locale: locale, completionHandler: { (runes) in
                XCTAssertNotNil(runes)
                expectation.fulfill()
            }, errorHandler: { (error) in
                if version.isVersion(greaterThanOrEqualTo: "7.24.1") {
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

    func testSummonerSpells() {
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

    func testVersions() {
        let expectation = XCTestExpectation(description: "Version")
        DragonService.Version().list { (versions) in
            XCTAssertNotNil(versions)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 15.0)
    }


    static var allTests = [
        ("testChampions", testChampions),
        ("testChampions2", testChampions2),
        ("testItems", testItems),
        ("testLanguages", testLanguages),
        ("testLanguages2", testLanguages2),
        ("testMasteries", testMasteries),
        ("testProfileIcons", testProfileIcons),
        ("testRealms", testRealms),
        ("testRunes", testRunes),
        ("testSummonerSpells", testSummonerSpells),
        ("testVersions", testVersions)
    ]
}
