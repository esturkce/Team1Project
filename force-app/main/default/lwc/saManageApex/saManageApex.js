import { LightningElement, wire } from "lwc";
import getAllSA from "@salesforce/apex/SAManager.getAllSA";


export default class SAManageApex extends LightningElement {

 sadetails;
 
  @wire (getAllSA)
  loadSAdetails(result) {
    this.sadetails = result;
  }
}