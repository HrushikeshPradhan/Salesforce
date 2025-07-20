import { LightningElement } from 'lwc';

export default class ApiMethod extends LightningElement {
    handleApiCall() {
        this.template.querySelector('c-clock').refresh();
    }
}