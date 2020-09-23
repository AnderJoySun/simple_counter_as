import { env } from "near-sdk-core";


/**
 * Memory location for key. In Wasm memory starts zero'd.
 * Would be better to ensure that the key is the same value.
 * e.g. `memory.data([42])` returns the memory location where 42 was written.
 * This adds to the data section so that it gets copied when initializing.
 */
export const KEY_PTR = <u64>0;
export const KEY_LEN = <u64>sizeof<u64>();


export const VAL_PTR = KEY_PTR + KEY_LEN;
export const VAL_LEN = <u64>sizeof<u32>();

// Register provided by host, e.i. a hashmap of u64 -> blob of bytes.
export const REG: u64 = <u64>0;

export function setCounter(val: u32): void {
  // Write the value to memory.
  store<u32>(<usize>VAL_PTR, val);
  // Tell the host where the key and value are located and their lengths.
  // If there is an old value it is written to REG.
  env.storage_write(KEY_LEN, KEY_PTR, VAL_LEN, VAL_PTR, REG); 
}

export function loadCounter(): u32 {
  // Check if key is in storage
  if (!env.storage_has_key(KEY_LEN, KEY_PTR)) {
    // Initialize to zero.
    setCounter(0);
  }
  // Read the value into REG
  env.storage_read(KEY_LEN, KEY_PTR, REG);
  // Next write the value to memory.
  // Normally we'd want to use `env.register_len` to allocate the correct space.
  // However, we already know the length of the value
  env.read_register(REG, VAL_PTR);
  // Load the value from memory
  return load<u32>(<usize>VAL_PTR);
}