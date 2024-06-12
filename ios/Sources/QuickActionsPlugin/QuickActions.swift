import Foundation

@objc public class QuickActions: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
