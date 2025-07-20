import { api, LightningElement } from 'lwc';

export default class Clock extends LightningElement {
    currentTime;
    
    @api
    refresh() {
        this.currentTime = new Date();  
    }
}