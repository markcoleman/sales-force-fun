import { LightningElement, track, api } from "lwc";
import getCaseStatusByNumber from "@salesforce/apex/CaseOrchestrator.getCaseStatusByNumber";

export default class MemberDisputePanel extends LightningElement {
  @track caseNumber = "";
  @track _caseStatus = "";
  @track _error = "";
  @track isLoading = false;

  // Public getters for test access
  @api get caseStatus() {
    return this._caseStatus;
  }
  @api get error() {
    return this._error;
  }

  handleInputChange(event) {
    this.caseNumber = event.target.value.trim();
  }

  async handleSubmit() {
    this._error = "";
    this._caseStatus = "";
    if (!this.caseNumber) {
      this._error = "Please enter a valid Case Number.";
      return;
    }
    this.isLoading = true;
    try {
      const status = await getCaseStatusByNumber(this.caseNumber);
      this._caseStatus = status ? status : "Case not found";
    } catch (err) {
      this._error =
        err.body && err.body.message
          ? err.body.message
          : err.message || "Unknown error occurred";
    } finally {
      this.isLoading = false;
    }
  }
}
