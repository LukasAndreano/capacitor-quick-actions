import Foundation
import UIKit

@objc public class QuickActions: NSObject {
    
    @objc public func addQuickActions(_ actions: [[String: String]]) {
        var shortcutItems: [UIApplicationShortcutItem] = []
        
        for action in actions {
            let title = action["title"] ?? ""
            let iconName = action["iconName"] ?? ""
            let description = action["description"] ?? nil
            let id = action["id"] ?? UUID().uuidString
            
            var icon: UIApplicationShortcutIcon?
            
            // Использование SF Symbols для системных иконок
            if #available(iOS 13.0, *) {
                if let systemIcon = UIImage(systemName: iconName) {
                    icon = UIApplicationShortcutIcon(systemImageName: iconName)
                } else {
                    icon = UIApplicationShortcutIcon(templateImageName: iconName)
                }
            } else {
                // Использование пользовательской иконки для версий iOS ниже 13.0
                icon = UIApplicationShortcutIcon(templateImageName: iconName)
            }
            
            let shortcutItem = UIApplicationShortcutItem(
                type: id,
                localizedTitle: title,
                localizedSubtitle: description,
                icon: icon,
                userInfo: ["id": id] as [String: NSSecureCoding]
            )
            
            shortcutItems.append(shortcutItem)
        }
        
        DispatchQueue.main.async {
            UIApplication.shared.shortcutItems = shortcutItems
        }
    }
    
    @objc public func clearQuickActions() {
        DispatchQueue.main.async {
            UIApplication.shared.shortcutItems = []
        }
    }
    
    @objc public static func handleQuickAction(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        NotificationCenter.default.post(name: Notification.Name("QuickActionSelected"), object: ["type": shortcutItem.type])
        return true
    }
}
