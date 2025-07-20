import { LightningElement } from 'lwc';

export default class EventController extends LightningElement {
    currentPage = 1;
    totalPages = 10;

    handlePageChange(event) {
        this.currentPage = event.detail.currentPage;
        this.totalPages = event.detail.totalPages;
    }
}