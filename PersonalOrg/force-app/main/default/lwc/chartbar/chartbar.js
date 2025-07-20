import { LightningElement ,api } from 'lwc';

export default class Chartbar extends LightningElement {
    @api percentage; // reactive variable from parent component
}