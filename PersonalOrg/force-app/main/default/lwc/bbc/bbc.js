import { api, LightningElement, wire } from 'lwc';

import mostreads from'@salesforce/apex/bbc.mostreads';

export default class Bbcnews extends LightningElement {

@api mostread = 'Most read';

articles = [];

@wire(mostreads)
    data({ error, data }) {
        if (data) {
            this.articles = data;
        } else if (error) {
            console.error('Error fetching articles:', error);
        }
    }
get articlesWithIndex() {
    return this.articles.map((article, index) => {
        return { ...article, index: index + 1 };
    });
}

}