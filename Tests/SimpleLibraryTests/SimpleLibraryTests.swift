import Testing
@testable import SimpleLibrary

struct CalculatorTests {
    let calculator = Calculator()

    @Test func addition() {
        #expect(calculator.add(2, 3) == 5)
        #expect(calculator.add(-1, 1) == 0)
        #expect(calculator.add(0.5, 0.5) == 1.0)
    }

    @Test func subtraction() {
        #expect(calculator.subtract(5, 3) == 2)
        #expect(calculator.subtract(0, 5) == -5)
        #expect(calculator.subtract(10.5, 0.5) == 10.0)
    }

    @Test func multiplication() {
        #expect(calculator.multiply(3, 4) == 12)
        #expect(calculator.multiply(-2, 3) == -6)
        #expect(calculator.multiply(0, 100) == 0)
    }

    @Test func division() throws {
        #expect(try calculator.divide(10, 2) == 5)
        #expect(try calculator.divide(7, 2) == 3.5)
        #expect(try calculator.divide(-10, 2) == -5)
    }

    @Test func divisionByZero() {
        #expect(throws: CalculatorError.divisionByZero) {
            try calculator.divide(10, 0)
        }
    }
}

struct StringHelperTests {
    let stringHelper = StringHelper()

    @Test func reverse() {
        #expect(stringHelper.reverse("hello") == "olleh")
        #expect(stringHelper.reverse("Swift") == "tfiwS")
        #expect(stringHelper.reverse("") == "")
        #expect(stringHelper.reverse("a") == "a")
    }

    @Test func isPalindrome() {
        #expect(stringHelper.isPalindrome("racecar") == true)
        #expect(stringHelper.isPalindrome("A man a plan a canal Panama") == true)
        #expect(stringHelper.isPalindrome("hello") == false)
        #expect(stringHelper.isPalindrome("") == true)
    }

    @Test func wordCount() {
        #expect(stringHelper.wordCount("Hello World") == 2)
        #expect(stringHelper.wordCount("This is a test") == 4)
        #expect(stringHelper.wordCount("") == 0)
        #expect(stringHelper.wordCount("SingleWord") == 1)
    }
}