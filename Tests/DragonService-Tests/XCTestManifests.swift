import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ChampionTests.allTests),
        testCase(ItemTests.allTests),
        testCase(LanguageTests.allTests),
        testCase(MasteryTests.allTests),
        testCase(PerkTests.allTests),
        testCase(ProfileIconTests.allTests),
        testCase(RealmTests.allTests),
        testCase(RuneTests.allTests),
        testCase(SummonerSpellTests.allTests),
        testCase(VersionTests.allTests)
    ]
}
#endif
