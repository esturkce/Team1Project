import { LightningElement, wire } from "lwc";
import getSA from "@salesforce/apex/SAManager.getSA";

export default class SAManageApex extends LightningElement {

  sadetails;

  @wire(getSA, {})
  loadSAdetails(result) {
  }
}