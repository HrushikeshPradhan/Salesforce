import { LightningElement } from 'lwc';

export default class LifecycleHooksExample extends LightningElement {
    isChildVisible = true;
    // Lifecycle hooks
    // These methods are called at different stages of the component's lifecycle
    constructor() {
        super();
        console.log('Component is constructed');
    }
    connectedCallback() {
        console.log('Component is inserted into the DOM');
    }
    renderedCallback() {
        console.log('Component is rendered in the DOM');
    }
    errorCallback(error) {
        console.log('Error in component');
        console.error('Error in component :', error);
    }
    handleClick() {
        this.isChildVisible = !this.isChildVisible;
    }
}