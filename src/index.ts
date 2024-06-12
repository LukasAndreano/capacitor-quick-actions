import { registerPlugin } from '@capacitor/core';

import type { QuickActionsPlugin } from './definitions';

const QuickActions = registerPlugin<QuickActionsPlugin>('QuickActions', {
  web: () => import('./web').then(m => new m.QuickActionsWeb()),
});

export * from './definitions';
export { QuickActions };
