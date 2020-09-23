# Simple Counter

This example shows how to make a simple NEAR AssemblyScript contract. Normally the sdk
does a lot behind the scenes. When calling a function with arguments it deserializes it for you,
so in this example each exposed function has no arguments. Furthermore, if a function returns
a value the sdk will serialize it for you too, so again these functions do not return anything.

Unfortunately current the serialization must be imported, which adds bloat to the generated binary.
In this example we only use the host imports and the generated optimized binary is only 309 bytes!

The advantage to using AssemblyScript is that you can write code that generates Wasm text that is
readable and close to the code that you wrote. This makes AssemblyScript a great language to learn about
WebAssembly!

# Notes

Running `yarn build` will build both a debug and a release version of the binary and a text version.

See `build/debug/simple_counter_as.wat` and `build/release/simple_counter_as.wat` for the generated Wasm.

Running `yarn test` will run a simple unit test.
