import { LightningElement } from 'lwc';

export default class LifecycleHooksChildComponent extends LightningElement {
    constructor() {
        super();
        console.log('Child component is constructed');
    }

    connectedCallback() {
        console.log('Child component is inserted into the DOM');
    }

    disconnectedCallback() {
        console.log('Child component is removed from the DOM');
    }

    renderedCallback() {
        console.log('Child component is rendered in the DOM');
    }
}