import XCTest
@testable import Cast

class castTests: XCTestCase
{
    func testCompilation()
	{
        XCTAssertNotEqual("Yup, tests pass.", "Everything must be solid.")
    }

    static var allTests : [(String, (castTests) -> () throws -> Void)]
	{
        return [
            ("testCompilation", testCompilation),
        ]
    }
}
