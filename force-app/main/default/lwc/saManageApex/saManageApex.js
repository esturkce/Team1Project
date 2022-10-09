import { LightningElement, wire } from "lwc";
import searchSas from "@salesforce/apex/SAManager1.searchSas";


export default class SAManageApex extends LightningElement {

 sadetails;

  @wire (searchSas)
  
  loadSAdetails(result) {
    this.sadetails = result;
  }
}