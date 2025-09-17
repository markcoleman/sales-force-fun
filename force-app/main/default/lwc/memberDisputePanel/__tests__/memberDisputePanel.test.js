import { createElement } from "lwc";
import MemberDisputePanel from "c/memberDisputePanel";
import getCaseStatusByNumber from "@salesforce/apex/CaseOrchestrator.getCaseStatusByNumber";

jest.mock(
  "@salesforce/apex/CaseOrchestrator.getCaseStatusByNumber",
  () => ({
    default: jest.fn()
  }),
  { virtual: true }
);

describe("c-member-dispute-panel", () => {
  afterEach(() => {
    while (document.body.firstChild) {
      document.body.removeChild(document.body.firstChild);
    }
    jest.clearAllMocks();
  });

  it("shows error when input is empty", async () => {
    const element = createElement("c-member-dispute-panel", {
      is: MemberDisputePanel
    });
    document.body.appendChild(element);

    const button = element.shadowRoot.querySelector("lightning-button");
    button.click();
    await Promise.resolve();
    expect(element.error).toBe("Please enter a valid Case Number.");
  });

  it("shows case status when Apex returns a value", async () => {
    getCaseStatusByNumber.mockResolvedValue("Closed");
    const element = createElement("c-member-dispute-panel", {
      is: MemberDisputePanel
    });
    document.body.appendChild(element);

    const input = element.shadowRoot.querySelector("lightning-input");
    input.value = "12345";
    input.dispatchEvent(new CustomEvent("change"));

    const button = element.shadowRoot.querySelector("lightning-button");
    button.click();

    await Promise.resolve();
    await Promise.resolve();

    expect(element.caseStatus).toBe("Closed");
    expect(element.error).toBe("");
  });

  it("shows error when Apex throws", async () => {
    getCaseStatusByNumber.mockRejectedValue({
      body: { message: "Apex error" }
    });
    const element = createElement("c-member-dispute-panel", {
      is: MemberDisputePanel
    });
    document.body.appendChild(element);

    const input = element.shadowRoot.querySelector("lightning-input");
    input.value = "12345";
    input.dispatchEvent(new CustomEvent("change"));

    const button = element.shadowRoot.querySelector("lightning-button");
    button.click();

    await Promise.resolve();
    await Promise.resolve();

    expect(element.error).toBe("Apex error");
    expect(element.caseStatus).toBe("");
  });

  it("disables button and shows spinner when loading", async () => {
    let resolveFn;
    getCaseStatusByNumber.mockImplementation(
      () =>
        new Promise((resolve) => {
          resolveFn = resolve;
        })
    );
    const element = createElement("c-member-dispute-panel", {
      is: MemberDisputePanel
    });
    document.body.appendChild(element);

    const input = element.shadowRoot.querySelector("lightning-input");
    input.value = "12345";
    input.dispatchEvent(new CustomEvent("change"));

    const button = element.shadowRoot.querySelector("lightning-button");
    button.click();
    await Promise.resolve();
    expect(button.disabled).toBe(true);
    expect(
      element.shadowRoot.querySelector("lightning-spinner")
    ).not.toBeNull();
    resolveFn("Closed");
    await Promise.resolve();
  });
});
