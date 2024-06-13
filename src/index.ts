import { registerPlugin } from '@capacitor/core';

import type { QuickActionsPlugin } from './definitions';

const QuickActions = registerPlugin<QuickActionsPlugin>('QuickActions');

export * from './definitions';
export { QuickActions };