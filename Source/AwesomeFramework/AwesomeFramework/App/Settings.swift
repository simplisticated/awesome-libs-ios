import Foundation

public class SettingsItem<Value: Any> {
    public let userDefaults: UserDefaults
    public let key: String
    public let defaultValue: Value
    
    public var value: Value {
        get {
            let result = self.userDefaults.value(
                forKey: self.key
            ) as? Value
            return result ?? self.defaultValue
        }
        set {
            self.userDefaults.setValue(
                newValue,
                forKey: self.key
            )
        }
    }
    
    public init(
        userDefaults: UserDefaults,
        key: String,
        defaultValue: Value
    ) {
        self.userDefaults = userDefaults
        self.key = key
        self.defaultValue = defaultValue
    }
}

public struct Settings {
    
    private static let userDefaults = UserDefaults.standard
    
    public static let launchCount = SettingsItem(
        userDefaults: userDefaults,
        key: "launch-count",
        defaultValue: 0
    )
    
    public static let reviewRequestTimestamp = SettingsItem<TimeInterval?>(
        userDefaults: userDefaults,
        key: "review-request-timestamp",
        defaultValue: nil
    )
    
    public static var didRequestReview: Bool {
        return self.reviewRequestTimestamp.value != nil
    }
}
