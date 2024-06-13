import type {PluginListenerHandle} from "@capacitor/core";

export interface QuickAction {
  id: string;
  title: string;
  iconName: string;
  description?: string;
}

export interface QuickActionsPlugin {
  addQuickActions(options: { actions: QuickAction[] }): Promise<void>;
  clearQuickActions(): Promise<void>;
  addListener(eventName: 'quickActionSelected', listenerFunc: (data: { type: string }) => void): PluginListenerHandle;
}