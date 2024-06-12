export interface QuickActionsPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
