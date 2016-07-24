import XCTest
import PromiseKit

class WhenConcurrentTestCase_Swift: XCTestCase {

    func testWhen() {
        let e = expectation(description: "")

        var numbers = (0..<42).makeIterator()
        let squareNumbers = numbers.map { $0 * $0 }

        let generator = AnyIterator<Promise<Int>> {
            guard let number = numbers.next() else {
                return nil
            }

            return after(interval: 0.01).then {
                return number * number
            }
        }

        when(fulfilled: generator, concurrently: 5)
            .then { numbers -> Void in
                if numbers == squareNumbers {
                    e.fulfill()
                }
            }

        waitForExpectations(timeout: 3, handler: nil)
    }

    func testWhenEmptyGenerator() {
        let e = expectation(description: "")

        let generator = AnyIterator<Promise<Int>> {
            return nil
        }

        when(fulfilled: generator, concurrently: 5)
            .then { numbers -> Void in
                if numbers.count == 0 {
                    e.fulfill()
                }
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testWhenGeneratorError() {
        enum LocalError: ErrorProtocol {
            case Unknown
            case DivisionByZero
        }

        let expectedErrorIndex = 42
        let expectedError = LocalError.DivisionByZero

        let e = expectation(description: "")

        var numbers = (-expectedErrorIndex..<expectedErrorIndex).makeIterator()

        let generator = AnyIterator<Promise<Int>> {
            guard let number = numbers.next() else {
                return nil
            }

            return after(interval: 0.01).then {
                guard number != 0 else {
                    return Promise.resolved(error: expectedError)
                }

                return Promise.resolved(value: 100500 / number)
            }
        }

        when(fulfilled: generator, concurrently: 3)
            .catch { error in
                guard let error = error as? Error else {
                    return
                }

                guard case .when(let errorIndex, let internalError) = error else {
                    return
                }

                guard let localInternalError = internalError as? LocalError else {
                    return
                }

                guard errorIndex == expectedErrorIndex && localInternalError == expectedError else {
                    return
                }

                e.fulfill()
            }

        waitForExpectations(timeout: 3, handler: nil)
    }

    func testWhenConcurrency() {
        let expectedConcurrently = 4
        var currentConcurrently = 0
        var maxConcurrently = 0

        let e = expectation(description: "")

        var numbers = (0..<42).makeIterator()

        let generator = AnyIterator<Promise<Int>> {
            currentConcurrently += 1
            maxConcurrently = max(maxConcurrently, currentConcurrently)

            guard let number = numbers.next() else {
                return nil
            }

            return after(interval: 0.01).then {
                currentConcurrently -= 1
                return Promise.resolved(value: number * number)
            }
        }

        when(fulfilled: generator, concurrently: expectedConcurrently)
            .then { numbers -> Void in
                if expectedConcurrently == maxConcurrently {
                    e.fulfill()
                }
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    func testWhenConcurrencyLessThanZero() {
        InjectedErrorUnhandler = { err in
            guard case Error.whenConcurrentlyZero = err else { return XCTFail() }
        }

        let generator = AnyIterator<Promise<Int>> { XCTFail(); return nil }

        let p1 = when(fulfilled: generator, concurrently: 0)
        let p2 = when(fulfilled: generator, concurrently: -1)

        guard let e1 = p1.error else { return XCTFail() }
        guard let e2 = p2.error else { return XCTFail() }
        guard case Error.whenConcurrentlyZero = e1 else { return XCTFail() }
        guard case Error.whenConcurrentlyZero = e2 else { return XCTFail() }
    }
}
