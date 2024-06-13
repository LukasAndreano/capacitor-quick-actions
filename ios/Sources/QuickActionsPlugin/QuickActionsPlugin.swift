import Foundation
import Capacitor

@objc(QuickActionsPlugin)
public class QuickActionsPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "QuickActionsPlugin"
    public let jsName = "QuickActions"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "addQuickActions", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "clearQuickActions", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = QuickActions()

    @objc func addQuickActions(_ call: CAPPluginCall) {
        guard let actions = call.getArray("actions", [String: String].self) else {
            call.reject("Invalid actions format")
            return
        }
        implementation.addQuickActions(actions)
        call.resolve()
    }
    
    @objc func clearQuickActions(_ call: CAPPluginCall) {
        implementation.clearQuickActions()
        call.resolve()
    }
    
    @objc public override func load() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleQuickAction(notification:)), name: Notification.Name("QuickActionSelected"), object: nil)
    }
    
    @objc func handleQuickAction(notification: Notification) {
        if let data = notification.object as? [String: String] {
            notifyListeners("quickActionSelected", data: data, retainUntilConsumed: true)
        }
    }
}
