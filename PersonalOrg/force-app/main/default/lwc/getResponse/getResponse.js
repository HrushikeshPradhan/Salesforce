import { LightningElement } from 'lwc';
import getResponse from '@salesforce/apex/webCallout.getResponse';

export default class GetResponse extends LightningElement {

    statusCode;
    statusText;

    handleGetResponse() {
        getResponse()
            .then(result => {
                if(result.success === true){
                    this.statusCode = '200';
                    this.statusText = 'ok';
                }
                else{
                    this.statusCode = '404';
                    this.statusText = 'Not Found';
                }
            })
            .catch(error => {
                console.log('error: ' + error);
            });
    }
}