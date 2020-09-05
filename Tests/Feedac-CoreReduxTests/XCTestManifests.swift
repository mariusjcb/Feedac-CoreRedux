import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Feedac_CoreReduxTests.allTests),
    ]
}
#endif
