# Capacitor Quick Actions

Plugin for using [Quick Actions](https://developer.apple.com/documentation/uikit/menus_and_shortcuts/add_home_screen_quick_actions#3701696) in your Capacitor Apps.  
Now it supports only on iOS/iPadOS 13+.

![](https://github.com/lukasandreano/capacitor-quick-actions/blob/main/docs/preview.png)

## Install

```bash
npm install capacitor-quick-actions
npx cap sync
```

## Preparation
Modify your `AppDelegate.swift`:
1. Add `import CapacitorQuickActions` to the top of the file.
2. Add `application function` to the bottom of the file:
```swift
func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handled = QuickActions.handleQuickAction(shortcutItem)
        completionHandler(handled)
}
```
Example of the `AppDelegate.swift` file available [here](https://github.com/lukasandreano/capacitor-quick-actions/blob/main/docs/AppDelegate.swift). 

## Usage
```typescript
// Import the plugin
import { QuickActions } from 'capacitor-quick-actions';

// Add buttons to the home screen
const addButtonsToHomeScreen = async () => {
    await QuickActions.addQuickActions({
        actions: [
            { id: "button1", title: 'Action1', iconName: 'house', description: 'Description1' },
            { id: "button2", title: 'Action2', iconName: '2' } // Description is optional
        ]
    });
}

// Remove buttons from the home screen
const clearButtonsFromHomeScreen = async () => {
    await QuickActions.clearQuickActions();
}

// Add Listener for the selected action
QuickActions.addListener('quickActionSelected', (data) => {
    console.log('Quick Action selected:', data.type); // returns id of the selected action
});
```

## Icons
To use icons in your quick actions provide the name of the icon from [this app](https://developer.apple.com/sf-symbols/).

## API

<docgen-index>

* [`addQuickActions(...)`](#addquickactions)
* [`clearQuickActions()`](#clearquickactions)
* [`addListener('quickActionSelected', ...)`](#addlistenerquickactionselected-)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### addQuickActions(...)

```typescript
addQuickActions(options: { actions: QuickAction[]; }) => Promise<void>
```

| Param         | Type                                     |
| ------------- | ---------------------------------------- |
| **`options`** | <code>{ actions: QuickAction[]; }</code> |

--------------------


### clearQuickActions()

```typescript
clearQuickActions() => Promise<void>
```

--------------------


### addListener('quickActionSelected', ...)

```typescript
addListener(eventName: 'quickActionSelected', listenerFunc: (data: { type: string; }) => void) => PluginListenerHandle
```

| Param              | Type                                              |
| ------------------ | ------------------------------------------------- |
| **`eventName`**    | <code>'quickActionSelected'</code>                |
| **`listenerFunc`** | <code>(data: { type: string; }) =&gt; void</code> |

**Returns:** <code><a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### Interfaces


#### QuickAction

| Prop              | Type                |
| ----------------- | ------------------- |
| **`id`**          | <code>string</code> |
| **`title`**       | <code>string</code> |
| **`iconName`**    | <code>string</code> |
| **`description`** | <code>string</code> |


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |

</docgen-api>
