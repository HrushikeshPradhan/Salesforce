import { LightningElement } from 'lwc';

export default class ApiProperty extends LightningElement {
    percentage = 0; //private variable that stores a number value in the range of 0 to 100

    // Event handler that updates the percentage value when the input field changes
    handlePercentageChange(event) {
        this.percentage = event.target.value;
    }
}