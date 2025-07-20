import { api, LightningElement } from 'lwc';

export default class Paginator extends LightningElement {

    currentPage = 1;
    totalPages = 10;
    
    handlePrevious(event) {
        this.currentPage = Math.max(1, this.currentPage - 1);
        this.dispatchEvent(new CustomEvent('pagechange', {
            detail: {
                currentPage: this.currentPage,
                totalPages: this.totalPages
            }
        }));
    }

    handleNext(event) {
        this.currentPage = Math.min(this.totalPages, this.currentPage + 1);
        this.dispatchEvent(new CustomEvent('pagechange', {
            detail: {
                currentPage: this.currentPage,
                totalPages: this.totalPages
            }
        }));
    }
}
