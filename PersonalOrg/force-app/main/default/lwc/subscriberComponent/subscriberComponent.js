import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import COMPONENT_COMMUNICATION_CHANNEL from '@salesforce/messageChannel/ComponentCommunicationChannel__c';

export default class SubscriberComponent extends LightningElement {
    receivedMessage = 'No Message Received Yet';
    // Wire the MessageContext to enable message subscription
    // This allows the component to listen for messages published on the channel
    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel() {
        subscribe(this.messageContext, COMPONENT_COMMUNICATION_CHANNEL, (payload) => this.handleMessage(payload));
    }

    // Logic to handle incoming messages from the publisher component
    handleMessage(payload) {
        // Process the message received from the publisher
        console.log('Received message:', payload.msg);
        this.receivedMessage = payload.msg;
    }
}