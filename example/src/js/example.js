import { QuickActions } from 'capacitor-quick-actions';

window.addButtons = async () => {
    await QuickActions.addQuickActions({
        actions: [
            { id: "test", title: 'Action1', iconName: '1', description: 'Description1' },
            { id: "test2", title: 'Action2', iconName: '2' } // Description is optional
        ]
    });
}

QuickActions.addListener('quickActionSelected', (data) => {
    console.log('Quick Action selected:', data.type);
    // Handle the action here
});