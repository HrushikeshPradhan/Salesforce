import { LightningElement , wire} from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import COMPONENT_COMMUNICATION_CHANNEL from '@salesforce/messageChannel/ComponentCommunicationChannel__c';


export default class PublisherComponent extends LightningElement {
    message = '';
    // Wire the MessageContext to enable message publishing
    // This allows the component to publish messages to the channel
    @wire(MessageContext)
    messageContext;

    handlePublish() {
        const payload = {
            msg: this.message
        };
        publish(this.messageContext, COMPONENT_COMMUNICATION_CHANNEL, payload);
    }

    handleInputChange(event) {
        this.message = event.target.value;
    }
}