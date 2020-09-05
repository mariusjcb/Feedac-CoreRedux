import XCTest
@testable import Feedac_CoreRedux

final class Feedac_CoreReduxTests: XCTestCase {
    private let sutStore = Store<SutState>(SutState(), using: SutReducer)
    
    func test() {
        XCTAssert(sutStore.state.count == 0, "Invalid Init State")
        sutStore.dispatch(action: SutIncrementAction())
        DispatchQueue.main.async {
            XCTAssert(self.sutStore.state.count == 1, "Invalid State after Reduce")
        }
    }

    static var allTests = [
        ("test", test),
    ]
}

fileprivate struct SutIncrementAction: Action { }

fileprivate struct SutState: State {
    var count = 0
}

fileprivate let SutReducer: Reducer<SutState> = { state, action in
    var state = state
    switch action {
    case _ as SutIncrementAction:
        state.count += 1
    default:
        break
    }
    return state
}
