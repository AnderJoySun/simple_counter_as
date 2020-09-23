(module
 (type $none_=>_none (func))
 (type $i64_i64_=>_none (func (param i64 i64)))
 (type $i32_=>_none (func (param i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i64_i64_=>_i64 (func (param i64 i64) (result i64)))
 (type $i64_i64_i64_=>_i64 (func (param i64 i64 i64) (result i64)))
 (type $i64_i64_i64_i64_i64_=>_i64 (func (param i64 i64 i64 i64 i64) (result i64)))
 (import "env" "storage_has_key" (func $~lib/near-sdk-core/env/env/env.storage_has_key (param i64 i64) (result i64)))
 (import "env" "storage_write" (func $~lib/near-sdk-core/env/env/env.storage_write (param i64 i64 i64 i64 i64) (result i64)))
 (import "env" "storage_read" (func $~lib/near-sdk-core/env/env/env.storage_read (param i64 i64 i64) (result i64)))
 (import "env" "read_register" (func $~lib/near-sdk-core/env/env/env.read_register (param i64 i64)))
 (import "env" "value_return" (func $~lib/near-sdk-core/env/env/env.value_return (param i64 i64)))
 (memory $0 0)
 (export "memory" (memory $0))
 (export "increment" (func $assembly/index/increment))
 (export "decrement" (func $assembly/index/decrement))
 (export "getCounter" (func $assembly/index/getCounter))
 (func $assembly/counter/setCounter (param $0 i32)
  i32.const 8
  local.get $0
  i32.store
  i64.const 8
  i64.const 0
  i64.const 4
  i64.const 8
  i64.const 0
  call $~lib/near-sdk-core/env/env/env.storage_write
  drop
 )
 (func $assembly/counter/loadCounter (result i32)
  i64.const 8
  i64.const 0
  call $~lib/near-sdk-core/env/env/env.storage_has_key
  i64.eqz
  if
   i32.const 0
   call $assembly/counter/setCounter
  end
  i64.const 8
  i64.const 0
  i64.const 0
  call $~lib/near-sdk-core/env/env/env.storage_read
  drop
  i64.const 0
  i64.const 8
  call $~lib/near-sdk-core/env/env/env.read_register
  i32.const 8
  i32.load
 )
 (func $assembly/index/increment
  call $assembly/counter/loadCounter
  i32.const 1
  i32.add
  call $assembly/counter/setCounter
 )
 (func $assembly/index/decrement
  call $assembly/counter/loadCounter
  i32.const 1
  i32.sub
  call $assembly/counter/setCounter
 )
 (func $assembly/index/getCounter
  call $assembly/counter/loadCounter
  drop
  i64.const 4
  i64.const 8
  call $~lib/near-sdk-core/env/env/env.value_return
 )
)
