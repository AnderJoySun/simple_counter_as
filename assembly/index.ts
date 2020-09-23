import { env } from "near-sdk-core";
import { setCounter, loadCounter, VAL_LEN, VAL_PTR } from "./counter";

export function increment(): void {
  setCounter(loadCounter() + 1);
}

export function decrement(): void {
  setCounter(loadCounter() - 1);
}

export function getCounter(): void {
  // Write the value of the counter to memory
  loadCounter();
  // Tell host the location and length of the value
  env.value_return(VAL_LEN, VAL_PTR);
}
