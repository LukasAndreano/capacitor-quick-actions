import { WebPlugin } from '@capacitor/core';

import type { QuickActionsPlugin } from './definitions';

export class QuickActionsWeb extends WebPlugin implements QuickActionsPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
