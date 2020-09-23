import * as counter from "..";
import { loadCounter } from "../counter";


describe("A simple counter", ()=> {
  it("Should start at 0", () => {
    expect(loadCounter()).toBe(0);
  });

  it("One increment should be 1", () => {
    counter.increment();
    expect(loadCounter()).toBe(1);
  });

  it("One decrement should be -1", () => {
    counter.decrement();
    expect(loadCounter()).toBe(-1);
  });
});