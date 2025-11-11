import Foundation

#if canImport(Alamofire)
import Alamofire
public class AlamofireAdapter {
    
    public init() {
        
    }
    
    public func printSomething() {
        print("Alamofire detected")
        let parameters: [String: Any] = [
            "title": "foo",
            "body": "bar",
            "userId": 1
        ]
        AF.request("https://jsonplaceholder.typicode.com/posts",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
        .responseData { response in
            switch response.result {
            case .success(let data):
                if let jsonString = String(data: data, encoding:
                        .utf8) {
                    print("Response String: \(jsonString)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
#endif


public struct Calculator {
    public init() {}

    public func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }

    public func subtract(_ a: Double, _ b: Double) -> Double {
        return a - b
    }

    public func multiply(_ a: Double, _ b: Double) -> Double {
        return a * b
    }

    public func divide(_ a: Double, _ b: Double) throws -> Double {
        guard b != 0 else {
            throw CalculatorError.divisionByZero
        }
        return a / b
    }
}

public enum CalculatorError: Error, LocalizedError {
    case divisionByZero

    public var errorDescription: String? {
        switch self {
        case .divisionByZero:
            return "Cannot divide by zero"
        }
    }
}

public struct StringHelper {
    public init() {}

    public func reverse(_ text: String) -> String {
        return String(text.reversed())
    }

    public func isPalindrome(_ text: String) -> Bool {
        let cleaned = text.lowercased().filter { $0.isLetter }
        return cleaned == String(cleaned.reversed())
    }

    public func wordCount(_ text: String) -> Int {
        return text.split(separator: " ").count
    }
}
