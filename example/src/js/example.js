import { QuickActions } from 'kokateam-quick-actions';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    QuickActions.echo({ value: inputValue })
}
