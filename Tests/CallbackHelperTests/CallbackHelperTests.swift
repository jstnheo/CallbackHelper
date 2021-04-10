import XCTest
@testable import CallbackHelper

final class CallbackHelperTests: XCTestCase {
    var testCallback: Callback<Result<Bool, Error>>?
    
    func test_callback_on_main_thread() {
        testCallback = Callback.onMain(perform: { _ in
            XCTAssert(Thread.isMainThread)
        })
        
        testCallback?.withResult(.success(true))
    }
    
    func test_callback_success() {
        testCallback = Callback.onMain(perform: {
            result in
            if case .success(let bool) = result {
                XCTAssert(bool)
            }
        })
        
        testCallback?.withResult(.success(true))
    }
    
    func test_callback_fail() {
        let testError = NSError(domain: "test", code: 123, userInfo: nil)

        testCallback = Callback.onMain(perform: {
            result in
            if case .failure(let error) = result {
                XCTAssertNotNil(error)
            }
        })
        
        testCallback?.withResult(.failure(testError))
    }
    
    
    func test_current_thread_success() {
        testCallback = Callback.onCurrent(perform: {
            result in
            if case .success(let bool) = result {
                XCTAssert(bool)
            }
        })
        
        testCallback?.withResult(.success(true))
    }
    
    func test_another_success() {
        XCTAssert(true)
    }
}
