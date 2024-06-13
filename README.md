# kokateam-quick-actions

Quick Actions API for Capacitor App

## Install

```bash
npm install kokateam-quick-actions
npx cap sync
```

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
