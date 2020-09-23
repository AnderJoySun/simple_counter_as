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
 (table $0 1 funcref)
 (global $assembly/counter/KEY_PTR i64 (i64.const 0))
 (global $assembly/counter/KEY_LEN i64 (i64.const 8))
 (global $assembly/counter/VAL_PTR i64 (i64.const 8))
 (global $assembly/counter/VAL_LEN i64 (i64.const 4))
 (global $assembly/counter/REG i64 (i64.const 0))
 (export "memory" (memory $0))
 (export "increment" (func $assembly/index/increment))
 (export "decrement" (func $assembly/index/decrement))
 (export "getCounter" (func $assembly/index/getCounter))
 (func $assembly/counter/setCounter (param $0 i32)
  global.get $assembly/counter/VAL_PTR
  i32.wrap_i64
  local.get $0
  i32.store
  global.get $assembly/counter/KEY_LEN
  global.get $assembly/counter/KEY_PTR
  global.get $assembly/counter/VAL_LEN
  global.get $assembly/counter/VAL_PTR
  global.get $assembly/counter/REG
  call $~lib/near-sdk-core/env/env/env.storage_write
  drop
 )
 (func $assembly/counter/loadCounter (result i32)
  global.get $assembly/counter/KEY_LEN
  global.get $assembly/counter/KEY_PTR
  call $~lib/near-sdk-core/env/env/env.storage_has_key
  i64.const 0
  i64.ne
  i32.eqz
  if
   i32.const 0
   call $assembly/counter/setCounter
  end
  global.get $assembly/counter/KEY_LEN
  global.get $assembly/counter/KEY_PTR
  global.get $assembly/counter/REG
  call $~lib/near-sdk-core/env/env/env.storage_read
  drop
  global.get $assembly/counter/REG
  global.get $assembly/counter/VAL_PTR
  call $~lib/near-sdk-core/env/env/env.read_register
  global.get $assembly/counter/VAL_PTR
  i32.wrap_i64
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
  global.get $assembly/counter/VAL_LEN
  global.get $assembly/counter/VAL_PTR
  call $~lib/near-sdk-core/env/env/env.value_return
 )
)
