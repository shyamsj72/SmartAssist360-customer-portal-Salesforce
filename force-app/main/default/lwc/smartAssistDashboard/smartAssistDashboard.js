import { LightningElement, wire } from 'lwc';

import getDashboardData
from '@salesforce/apex/SmartAssistDashboardController.getDashboardData';

export default class SmartAssistDashboard extends LightningElement {

    dashboard = {};

    @wire(getDashboardData)
    wiredData({error,data}){

        if(data){
            this.dashboard = data;
        }

        if(error){
            console.error(error);
        }
    }
}