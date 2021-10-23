(module
  (type $0 (func (param i32)))
  (type $1 (func (param i32 i32 i32 i32) (result i32)))
  (type $2 (func (param i32 i64 i32) (result i32)))
  (type $3 (func (param i32 i32) (result i32)))
  (type $4 (func (param i64)))
  (type $5 (func))
  (type $6 (func (param i32 i32 i32) (result i32)))
  (type $7 (func (param i32) (result i32)))
  (type $8 (func (param i32 i32 i32)))
  (type $9 (func (param i32 i32)))
  (type $10 (func (result i32)))
  (type $11 (func (param i32 i32 i32 i32 i32) (result i32)))
  (type $12 (func (result i64)))
  (import "wasi_snapshot_preview1" "fd_write" (func $runtime.fd_write (param i32 i32 i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "clock_time_get" (func $runtime.clock_time_get (param i32 i64 i32) (result i32)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $runtime.args_sizes_get (param i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "args_get" (func $runtime.args_get (param i32 i32) (result i32)))
  (import "env" "setTimeout" (func $setTimeout (param i64)))
  (memory $14  2)
  (table $13  10 10 funcref)
  (global $15  (mut i32) (i32.const 65536))
  (export "memory" (memory $14))
  (export "free" (func $free))
  (export "realloc" (func $realloc))
  (export "_start" (func $_start))
  (export "resume" (func $resume))
  (export "alloc" (func $alloc))
  (export "stub" (func $stub))
  (elem $16 (i32.const 1)
    $runtime.chanRecv.destroy $runtime.chanRecv.resume $runtime.run$1.destroy $runtime.run$1.resume $main.main.destroy $main.main.resume $main.main$1.destroy $main.main$1.resume
    $.LNoopCoro.ResumeDestroy)
  
  (func $__wasm_call_ctors (type $5)
    )
  
  (func $memset (type $6)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (result i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i64)
    block $block
      local.get $2
      i32.eqz
      br_if $block
      local.get $0
      local.get $1
      i32.store8
      local.get $2
      local.get $0
      i32.add
      local.tee $3
      i32.const -1
      i32.add
      local.get $1
      i32.store8
      local.get $2
      i32.const 3
      i32.lt_u
      br_if $block
      local.get $0
      local.get $1
      i32.store8 offset=2
      local.get $0
      local.get $1
      i32.store8 offset=1
      local.get $3
      i32.const -3
      i32.add
      local.get $1
      i32.store8
      local.get $3
      i32.const -2
      i32.add
      local.get $1
      i32.store8
      local.get $2
      i32.const 7
      i32.lt_u
      br_if $block
      local.get $0
      local.get $1
      i32.store8 offset=3
      local.get $3
      i32.const -4
      i32.add
      local.get $1
      i32.store8
      local.get $2
      i32.const 9
      i32.lt_u
      br_if $block
      local.get $0
      i32.const 0
      local.get $0
      i32.sub
      i32.const 3
      i32.and
      local.tee $4
      i32.add
      local.tee $3
      local.get $1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee $1
      i32.store
      local.get $3
      local.get $2
      local.get $4
      i32.sub
      i32.const -4
      i32.and
      local.tee $4
      i32.add
      local.tee $2
      i32.const -4
      i32.add
      local.get $1
      i32.store
      local.get $4
      i32.const 9
      i32.lt_u
      br_if $block
      local.get $3
      local.get $1
      i32.store offset=8
      local.get $3
      local.get $1
      i32.store offset=4
      local.get $2
      i32.const -8
      i32.add
      local.get $1
      i32.store
      local.get $2
      i32.const -12
      i32.add
      local.get $1
      i32.store
      local.get $4
      i32.const 25
      i32.lt_u
      br_if $block
      local.get $3
      local.get $1
      i32.store offset=24
      local.get $3
      local.get $1
      i32.store offset=20
      local.get $3
      local.get $1
      i32.store offset=16
      local.get $3
      local.get $1
      i32.store offset=12
      local.get $2
      i32.const -16
      i32.add
      local.get $1
      i32.store
      local.get $2
      i32.const -20
      i32.add
      local.get $1
      i32.store
      local.get $2
      i32.const -24
      i32.add
      local.get $1
      i32.store
      local.get $2
      i32.const -28
      i32.add
      local.get $1
      i32.store
      local.get $4
      local.get $3
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee $5
      i32.sub
      local.tee $2
      i32.const 32
      i32.lt_u
      br_if $block
      local.get $1
      i64.extend_i32_u
      local.tee $6
      i64.const 32
      i64.shl
      local.get $6
      i64.or
      local.set $6
      local.get $3
      local.get $5
      i32.add
      local.set $1
      loop $loop
        local.get $1
        local.get $6
        i64.store
        local.get $1
        i32.const 24
        i32.add
        local.get $6
        i64.store
        local.get $1
        i32.const 16
        i32.add
        local.get $6
        i64.store
        local.get $1
        i32.const 8
        i32.add
        local.get $6
        i64.store
        local.get $1
        i32.const 32
        i32.add
        local.set $1
        local.get $2
        i32.const -32
        i32.add
        local.tee $2
        i32.const 31
        i32.gt_u
        br_if $loop
      end ;; $loop
    end ;; $block
    local.get $0
    )
  
  (func $memcpy (type $6)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (result i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i32)
    (local $8 i32)
    block $block
      block $block_0
        local.get $2
        i32.eqz
        br_if $block_0
        local.get $1
        i32.const 3
        i32.and
        i32.eqz
        br_if $block_0
        local.get $0
        local.set $3
        loop $loop
          local.get $3
          local.get $1
          i32.load8_u
          i32.store8
          local.get $2
          i32.const -1
          i32.add
          local.set $4
          local.get $3
          i32.const 1
          i32.add
          local.set $3
          local.get $1
          i32.const 1
          i32.add
          local.set $1
          local.get $2
          i32.const 1
          i32.eq
          br_if $block
          local.get $4
          local.set $2
          local.get $1
          i32.const 3
          i32.and
          br_if $loop
          br $block
        end ;; $loop
      end ;; $block_0
      local.get $2
      local.set $4
      local.get $0
      local.set $3
    end ;; $block
    block $block_1
      block $block_2
        local.get $3
        i32.const 3
        i32.and
        local.tee $2
        br_if $block_2
        block $block_3
          local.get $4
          i32.const 16
          i32.lt_u
          br_if $block_3
          loop $loop_0
            local.get $3
            local.get $1
            i32.load
            i32.store
            local.get $3
            i32.const 4
            i32.add
            local.get $1
            i32.const 4
            i32.add
            i32.load
            i32.store
            local.get $3
            i32.const 8
            i32.add
            local.get $1
            i32.const 8
            i32.add
            i32.load
            i32.store
            local.get $3
            i32.const 12
            i32.add
            local.get $1
            i32.const 12
            i32.add
            i32.load
            i32.store
            local.get $3
            i32.const 16
            i32.add
            local.set $3
            local.get $1
            i32.const 16
            i32.add
            local.set $1
            local.get $4
            i32.const -16
            i32.add
            local.tee $4
            i32.const 15
            i32.gt_u
            br_if $loop_0
          end ;; $loop_0
        end ;; $block_3
        block $block_4
          local.get $4
          i32.const 8
          i32.and
          i32.eqz
          br_if $block_4
          local.get $3
          local.get $1
          i64.load align=4
          i64.store align=4
          local.get $1
          i32.const 8
          i32.add
          local.set $1
          local.get $3
          i32.const 8
          i32.add
          local.set $3
        end ;; $block_4
        block $block_5
          local.get $4
          i32.const 4
          i32.and
          i32.eqz
          br_if $block_5
          local.get $3
          local.get $1
          i32.load
          i32.store
          local.get $1
          i32.const 4
          i32.add
          local.set $1
          local.get $3
          i32.const 4
          i32.add
          local.set $3
        end ;; $block_5
        block $block_6
          local.get $4
          i32.const 2
          i32.and
          i32.eqz
          br_if $block_6
          local.get $3
          local.get $1
          i32.load8_u
          i32.store8
          local.get $3
          local.get $1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get $3
          i32.const 2
          i32.add
          local.set $3
          local.get $1
          i32.const 2
          i32.add
          local.set $1
        end ;; $block_6
        local.get $4
        i32.const 1
        i32.and
        i32.eqz
        br_if $block_1
        local.get $3
        local.get $1
        i32.load8_u
        i32.store8
        local.get $0
        return
      end ;; $block_2
      block $block_7
        local.get $4
        i32.const 32
        i32.lt_u
        br_if $block_7
        block $block_8
          block $block_9
            block $block_10
              local.get $2
              i32.const -1
              i32.add
              br_table
                $block_10 $block_9 $block_8
                $block_7 ;; default
            end ;; $block_10
            local.get $3
            local.get $1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get $3
            local.get $1
            i32.load
            local.tee $5
            i32.store8
            local.get $3
            local.get $1
            i32.load8_u offset=2
            i32.store8 offset=2
            local.get $4
            i32.const -3
            i32.add
            local.set $4
            local.get $3
            i32.const 3
            i32.add
            local.set $6
            i32.const 0
            local.set $2
            loop $loop_1
              local.get $6
              local.get $2
              i32.add
              local.tee $3
              local.get $1
              local.get $2
              i32.add
              local.tee $7
              i32.const 4
              i32.add
              i32.load
              local.tee $8
              i32.const 8
              i32.shl
              local.get $5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get $3
              i32.const 4
              i32.add
              local.get $7
              i32.const 8
              i32.add
              i32.load
              local.tee $5
              i32.const 8
              i32.shl
              local.get $8
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get $3
              i32.const 8
              i32.add
              local.get $7
              i32.const 12
              i32.add
              i32.load
              local.tee $8
              i32.const 8
              i32.shl
              local.get $5
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get $3
              i32.const 12
              i32.add
              local.get $7
              i32.const 16
              i32.add
              i32.load
              local.tee $5
              i32.const 8
              i32.shl
              local.get $8
              i32.const 24
              i32.shr_u
              i32.or
              i32.store
              local.get $2
              i32.const 16
              i32.add
              local.set $2
              local.get $4
              i32.const -16
              i32.add
              local.tee $4
              i32.const 16
              i32.gt_u
              br_if $loop_1
            end ;; $loop_1
            local.get $6
            local.get $2
            i32.add
            local.set $3
            local.get $1
            local.get $2
            i32.add
            i32.const 3
            i32.add
            local.set $1
            br $block_7
          end ;; $block_9
          local.get $3
          local.get $1
          i32.load
          local.tee $5
          i32.store8
          local.get $3
          local.get $1
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get $4
          i32.const -2
          i32.add
          local.set $4
          local.get $3
          i32.const 2
          i32.add
          local.set $6
          i32.const 0
          local.set $2
          loop $loop_2
            local.get $6
            local.get $2
            i32.add
            local.tee $3
            local.get $1
            local.get $2
            i32.add
            local.tee $7
            i32.const 4
            i32.add
            i32.load
            local.tee $8
            i32.const 16
            i32.shl
            local.get $5
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get $3
            i32.const 4
            i32.add
            local.get $7
            i32.const 8
            i32.add
            i32.load
            local.tee $5
            i32.const 16
            i32.shl
            local.get $8
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get $3
            i32.const 8
            i32.add
            local.get $7
            i32.const 12
            i32.add
            i32.load
            local.tee $8
            i32.const 16
            i32.shl
            local.get $5
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get $3
            i32.const 12
            i32.add
            local.get $7
            i32.const 16
            i32.add
            i32.load
            local.tee $5
            i32.const 16
            i32.shl
            local.get $8
            i32.const 16
            i32.shr_u
            i32.or
            i32.store
            local.get $2
            i32.const 16
            i32.add
            local.set $2
            local.get $4
            i32.const -16
            i32.add
            local.tee $4
            i32.const 17
            i32.gt_u
            br_if $loop_2
          end ;; $loop_2
          local.get $6
          local.get $2
          i32.add
          local.set $3
          local.get $1
          local.get $2
          i32.add
          i32.const 2
          i32.add
          local.set $1
          br $block_7
        end ;; $block_8
        local.get $3
        local.get $1
        i32.load
        local.tee $5
        i32.store8
        local.get $4
        i32.const -1
        i32.add
        local.set $4
        local.get $3
        i32.const 1
        i32.add
        local.set $6
        i32.const 0
        local.set $2
        loop $loop_3
          local.get $6
          local.get $2
          i32.add
          local.tee $3
          local.get $1
          local.get $2
          i32.add
          local.tee $7
          i32.const 4
          i32.add
          i32.load
          local.tee $8
          i32.const 24
          i32.shl
          local.get $5
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get $3
          i32.const 4
          i32.add
          local.get $7
          i32.const 8
          i32.add
          i32.load
          local.tee $5
          i32.const 24
          i32.shl
          local.get $8
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get $3
          i32.const 8
          i32.add
          local.get $7
          i32.const 12
          i32.add
          i32.load
          local.tee $8
          i32.const 24
          i32.shl
          local.get $5
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get $3
          i32.const 12
          i32.add
          local.get $7
          i32.const 16
          i32.add
          i32.load
          local.tee $5
          i32.const 24
          i32.shl
          local.get $8
          i32.const 8
          i32.shr_u
          i32.or
          i32.store
          local.get $2
          i32.const 16
          i32.add
          local.set $2
          local.get $4
          i32.const -16
          i32.add
          local.tee $4
          i32.const 18
          i32.gt_u
          br_if $loop_3
        end ;; $loop_3
        local.get $6
        local.get $2
        i32.add
        local.set $3
        local.get $1
        local.get $2
        i32.add
        i32.const 1
        i32.add
        local.set $1
      end ;; $block_7
      block $block_11
        local.get $4
        i32.const 16
        i32.and
        i32.eqz
        br_if $block_11
        local.get $3
        local.get $1
        i32.load16_u align=1
        i32.store16 align=1
        local.get $3
        local.get $1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get $3
        local.get $1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get $3
        local.get $1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get $3
        local.get $1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get $3
        local.get $1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get $3
        local.get $1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get $3
        local.get $1
        i32.load8_u offset=8
        i32.store8 offset=8
        local.get $3
        local.get $1
        i32.load8_u offset=9
        i32.store8 offset=9
        local.get $3
        local.get $1
        i32.load8_u offset=10
        i32.store8 offset=10
        local.get $3
        local.get $1
        i32.load8_u offset=11
        i32.store8 offset=11
        local.get $3
        local.get $1
        i32.load8_u offset=12
        i32.store8 offset=12
        local.get $3
        local.get $1
        i32.load8_u offset=13
        i32.store8 offset=13
        local.get $3
        local.get $1
        i32.load8_u offset=14
        i32.store8 offset=14
        local.get $3
        local.get $1
        i32.load8_u offset=15
        i32.store8 offset=15
        local.get $3
        i32.const 16
        i32.add
        local.set $3
        local.get $1
        i32.const 16
        i32.add
        local.set $1
      end ;; $block_11
      block $block_12
        local.get $4
        i32.const 8
        i32.and
        i32.eqz
        br_if $block_12
        local.get $3
        local.get $1
        i32.load8_u
        i32.store8
        local.get $3
        local.get $1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get $3
        local.get $1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get $3
        local.get $1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get $3
        local.get $1
        i32.load8_u offset=4
        i32.store8 offset=4
        local.get $3
        local.get $1
        i32.load8_u offset=5
        i32.store8 offset=5
        local.get $3
        local.get $1
        i32.load8_u offset=6
        i32.store8 offset=6
        local.get $3
        local.get $1
        i32.load8_u offset=7
        i32.store8 offset=7
        local.get $3
        i32.const 8
        i32.add
        local.set $3
        local.get $1
        i32.const 8
        i32.add
        local.set $1
      end ;; $block_12
      block $block_13
        local.get $4
        i32.const 4
        i32.and
        i32.eqz
        br_if $block_13
        local.get $3
        local.get $1
        i32.load8_u
        i32.store8
        local.get $3
        local.get $1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get $3
        local.get $1
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get $3
        local.get $1
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get $3
        i32.const 4
        i32.add
        local.set $3
        local.get $1
        i32.const 4
        i32.add
        local.set $1
      end ;; $block_13
      block $block_14
        local.get $4
        i32.const 2
        i32.and
        i32.eqz
        br_if $block_14
        local.get $3
        local.get $1
        i32.load8_u
        i32.store8
        local.get $3
        local.get $1
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get $3
        i32.const 2
        i32.add
        local.set $3
        local.get $1
        i32.const 2
        i32.add
        local.set $1
      end ;; $block_14
      local.get $4
      i32.const 1
      i32.and
      i32.eqz
      br_if $block_1
      local.get $3
      local.get $1
      i32.load8_u
      i32.store8
    end ;; $block_1
    local.get $0
    )
  
  (func $strlen (type $7)
    (param $0 i32)
    (result i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    local.get $0
    local.set $1
    block $block
      block $block_0
        block $block_1
          local.get $0
          i32.const 3
          i32.and
          i32.eqz
          br_if $block_1
          block $block_2
            local.get $0
            i32.load8_u
            br_if $block_2
            local.get $0
            local.get $0
            i32.sub
            return
          end ;; $block_2
          local.get $0
          i32.const 1
          i32.add
          local.set $1
          loop $loop
            local.get $1
            i32.const 3
            i32.and
            i32.eqz
            br_if $block_1
            local.get $1
            i32.load8_u
            local.set $2
            local.get $1
            i32.const 1
            i32.add
            local.tee $3
            local.set $1
            local.get $2
            i32.eqz
            br_if $block_0
            br $loop
          end ;; $loop
        end ;; $block_1
        local.get $1
        i32.const -4
        i32.add
        local.set $1
        loop $loop_0
          local.get $1
          i32.const 4
          i32.add
          local.tee $1
          i32.load
          local.tee $2
          i32.const -1
          i32.xor
          local.get $2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if $loop_0
        end ;; $loop_0
        block $block_3
          local.get $2
          i32.const 255
          i32.and
          br_if $block_3
          local.get $1
          local.get $0
          i32.sub
          return
        end ;; $block_3
        loop $loop_1
          local.get $1
          i32.load8_u offset=1
          local.set $2
          local.get $1
          i32.const 1
          i32.add
          local.tee $3
          local.set $1
          local.get $2
          br_if $loop_1
          br $block
        end ;; $loop_1
      end ;; $block_0
      local.get $3
      i32.const -1
      i32.add
      local.set $3
    end ;; $block
    local.get $3
    local.get $0
    i32.sub
    )
  
  (func $math/bits.TrailingZeros32 (type $7)
    (param $0 i32)
    (result i32)
    block $block
      local.get $0
      br_if $block
      i32.const 32
      return
    end ;; $block
    i32.const 0
    local.get $0
    i32.sub
    local.get $0
    i32.and
    i32.const 125613361
    i32.mul
    i32.const 27
    i32.shr_u
    i32.const 65536
    i32.add
    i32.load8_u
    )
  
  (func $github.com/moontrade/memory/hash.FNV32a (type $7)
    (param $0 i32)
    (result i32)
    local.get $0
    i32.const 255
    i32.and
    i32.const -2128831035
    i32.xor
    i32.const 16777619
    i32.mul
    local.get $0
    i32.const 8
    i32.shr_u
    i32.const 255
    i32.and
    i32.xor
    i32.const 16777619
    i32.mul
    local.get $0
    i32.const 16
    i32.shr_u
    i32.const 255
    i32.and
    i32.xor
    i32.const 16777619
    i32.mul
    local.get $0
    i32.const 24
    i32.shr_u
    i32.xor
    i32.const 16777619
    i32.mul
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc (type $3)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    block $block
      block $block_0
        local.get $0
        i32.eqz
        br_if $block_0
        local.get $0
        local.get $1
        call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.allocateBlock
        local.tee $0
        i32.eqz
        br_if $block
        local.get $0
        i32.const 4
        i32.add
        return
      end ;; $block_0
      i32.const 65824
      call $runtime._panic
      unreachable
    end ;; $block
    i32.const 0
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.allocateBlock (type $3)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i64)
    (local $8 i64)
    block $block
      block $block_0
        block $block_1
          local.get $1
          i32.const 1073741821
          i32.ge_u
          br_if $block_1
          block $block_2
            local.get $0
            local.get $1
            i32.const 19
            i32.add
            i32.const -16
            i32.and
            i32.const -4
            i32.add
            i32.const 12
            local.get $1
            i32.const 12
            i32.gt_u
            select
            local.tee $2
            call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.searchBlock
            local.tee $1
            br_if $block_2
            local.get $0
            i32.eqz
            br_if $block_0
            local.get $0
            i32.const 20
            i32.add
            i32.load
            i32.eqz
            br_if $block
            i32.const 0
            local.set $1
            local.get $2
            local.set $3
            block $block_3
              local.get $2
              i32.const 536870909
              i32.gt_u
              br_if $block_3
              i32.const -1
              i32.const -1
              i32.const 27
              local.get $2
              call $github.com/moontrade/memory/tlsf.clz
              i32.sub
              local.tee $1
              i32.shl
              i32.const -1
              i32.xor
              local.get $1
              i32.const 31
              i32.gt_u
              select
              local.get $2
              i32.add
              local.set $3
              local.get $0
              i32.load offset=20
              i32.eqz
              local.set $1
            end ;; $block_3
            local.get $1
            br_if $block_0
            local.get $0
            i32.load
            i32.load offset=1568
            local.set $4
            local.get $0
            i32.const 80
            i32.add
            i32.load
            local.set $5
            memory.size
            local.set $1
            local.get $3
            i32.const 0
            i32.const 4
            local.get $5
            i32.const 16
            i32.shl
            local.get $4
            i32.const 4
            i32.ne
            i32.sub
            local.tee $4
            i32.shl
            local.get $4
            i32.const 31
            i32.gt_u
            select
            i32.add
            i32.const 65535
            i32.add
            i32.const 16
            i32.shr_s
            local.tee $6
            memory.grow
            drop
            i32.const 0
            local.get $1
            i32.const 16
            i32.shl
            local.get $1
            memory.size
            local.tee $3
            i32.eq
            local.tee $4
            select
            local.tee $1
            i32.const 0
            local.get $1
            select
            local.tee $5
            i32.eqz
            br_if $block
            i32.const 0
            local.get $3
            i32.const 16
            i32.shl
            local.get $4
            select
            i32.const 0
            local.get $1
            select
            local.tee $3
            i32.eqz
            br_if $block
            block $block_4
              local.get $6
              i32.const 0
              local.get $1
              select
              local.tee $1
              br_if $block_4
              local.get $3
              local.get $5
              i32.sub
              local.tee $1
              i32.const 16
              i32.shr_u
              local.get $1
              i32.const 65535
              i32.and
              i32.const 0
              i32.ne
              i32.add
              local.set $1
            end ;; $block_4
            local.get $0
            local.get $3
            i32.store offset=8
            local.get $0
            local.get $0
            i32.load offset=80
            local.get $1
            i32.add
            i32.store offset=80
            local.get $0
            local.get $5
            local.get $3
            call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.addMemory
            local.get $0
            local.get $2
            call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.searchBlock
            local.tee $1
            i32.eqz
            br_if $block
          end ;; $block_2
          local.get $0
          local.get $1
          call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.removeBlock
          block $block_5
            block $block_6
              local.get $1
              i32.load
              local.tee $3
              i32.const -4
              i32.and
              local.tee $4
              local.get $2
              i32.sub
              local.tee $5
              i32.const 16
              i32.lt_u
              br_if $block_6
              local.get $1
              local.get $3
              i32.const 2
              i32.and
              local.get $2
              i32.or
              i32.store
              local.get $2
              local.get $1
              i32.add
              i32.const 4
              i32.add
              local.tee $2
              i32.eqz
              br_if $block_0
              local.get $2
              local.get $5
              i32.const -4
              i32.add
              i32.const 1
              i32.or
              i32.store
              local.get $0
              local.get $2
              call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.insertBlock
              br $block_5
            end ;; $block_6
            local.get $1
            local.get $3
            i32.const -2
            i32.and
            i32.store
            local.get $1
            local.get $4
            i32.add
            i32.const 4
            i32.add
            local.tee $2
            i32.eqz
            br_if $block_0
            local.get $2
            local.get $2
            i32.load
            i32.const -3
            i32.and
            i32.store
          end ;; $block_5
          local.get $0
          i32.eqz
          br_if $block_0
          local.get $0
          i32.const 40
          i32.add
          local.tee $2
          local.get $2
          i64.load
          local.get $1
          i64.load32_u
          i64.const 4294967292
          i64.and
          local.tee $7
          i64.add
          local.tee $8
          i64.store
          block $block_7
            local.get $8
            local.get $0
            i32.const 48
            i32.add
            i64.load
            i64.le_s
            br_if $block_7
            local.get $0
            local.get $8
            i64.store offset=48
          end ;; $block_7
          local.get $0
          i32.const 56
          i32.add
          local.tee $2
          local.get $2
          i64.load
          local.get $7
          i64.sub
          i64.store
          local.get $0
          i32.const 64
          i32.add
          local.tee $0
          local.get $0
          i32.load
          i32.const 1
          i32.add
          i32.store
          local.get $1
          return
        end ;; $block_1
        i32.const 66056
        call $runtime._panic
        unreachable
      end ;; $block_0
      call $runtime.nilPanic
      unreachable
    end ;; $block
    i32.const 0
    )
  
  (func $runtime._panic (type $0)
    (param $0 i32)
    i32.const 66025
    i32.const 7
    call $runtime.printstring
    local.get $0
    call $runtime.printitf
    call $runtime.printnl
    unreachable
    unreachable
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.searchBlock (type $3)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    (local $2 i32)
    (local $3 i32)
    block $block
      local.get $0
      i32.eqz
      br_if $block
      local.get $0
      i32.load
      local.set $0
      block $block_0
        block $block_1
          local.get $1
          i32.const 256
          i32.lt_u
          br_if $block_1
          block $block_2
            local.get $1
            i32.const 536870909
            i32.gt_u
            br_if $block_2
            local.get $1
            i32.const 0
            i32.const 1
            i32.const 27
            local.get $1
            call $github.com/moontrade/memory/tlsf.clz
            i32.sub
            local.tee $2
            i32.shl
            local.get $2
            i32.const 31
            i32.gt_u
            select
            i32.add
            i32.const -1
            i32.add
            local.set $1
          end ;; $block_2
          i32.const 16
          local.get $1
          i32.const 27
          local.get $1
          call $github.com/moontrade/memory/tlsf.clz
          local.tee $3
          i32.sub
          local.tee $2
          i32.shr_u
          i32.const 16
          i32.xor
          local.get $2
          i32.const 31
          i32.gt_u
          select
          local.set $2
          i32.const 24
          local.get $3
          i32.sub
          local.set $1
          br $block_0
        end ;; $block_1
        local.get $1
        i32.const 4
        i32.shr_u
        local.set $2
        i32.const 0
        local.set $1
      end ;; $block_0
      block $block_3
        block $block_4
          i32.const 0
          i32.const -1
          local.get $2
          i32.shl
          local.get $2
          i32.const 31
          i32.gt_u
          select
          local.get $1
          i32.const 2
          i32.shl
          local.get $0
          i32.const 4
          i32.add
          local.tee $3
          i32.add
          i32.load
          i32.and
          local.tee $2
          br_if $block_4
          local.get $0
          i32.eqz
          br_if $block
          i32.const 0
          local.set $2
          local.get $0
          i32.load
          i32.const 0
          i32.const -1
          local.get $1
          i32.const 1
          i32.add
          local.tee $1
          i32.shl
          local.get $1
          i32.const 31
          i32.gt_u
          select
          i32.and
          local.tee $1
          i32.eqz
          br_if $block_3
          local.get $1
          call $math/bits.TrailingZeros32
          local.tee $1
          i32.const 2
          i32.shl
          local.get $3
          i32.add
          i32.load
          local.set $2
        end ;; $block_4
        local.get $0
        local.get $2
        call $math/bits.TrailingZeros32
        local.get $1
        i32.const 4
        i32.shl
        i32.add
        i32.const 2
        i32.shl
        i32.add
        i32.const 96
        i32.add
        i32.load
        local.set $2
      end ;; $block_3
      local.get $2
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $github.com/moontrade/memory/tlsf.clz (type $7)
    (param $0 i32)
    (result i32)
    (local $1 i32)
    (local $2 i32)
    block $block
      local.get $0
      i32.const 16
      i32.shr_u
      local.get $0
      local.get $0
      i32.const 65535
      i32.gt_u
      local.tee $1
      select
      local.tee $0
      i32.const 8
      i32.shr_u
      local.get $0
      local.get $0
      i32.const 255
      i32.gt_u
      local.tee $2
      select
      local.tee $0
      i32.const 256
      i32.lt_u
      br_if $block
      call $runtime.lookupPanic
      unreachable
    end ;; $block
    i32.const 32
    local.get $1
    i32.const 4
    i32.shl
    local.tee $1
    i32.const 8
    i32.or
    local.get $1
    local.get $2
    select
    local.get $0
    i32.const 65568
    i32.add
    i32.load8_u
    i32.add
    i32.sub
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.addMemory (type $8)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    block $block
      local.get $0
      i32.eqz
      br_if $block
      local.get $2
      i32.const -16
      i32.and
      local.set $2
      local.get $1
      i32.const 19
      i32.add
      i32.const -16
      i32.and
      local.tee $3
      i32.const -4
      i32.add
      local.set $1
      i32.const 1
      local.set $4
      block $block_0
        local.get $0
        i32.load
        i32.load offset=1568
        local.tee $5
        i32.eqz
        br_if $block_0
        local.get $3
        i32.const -20
        i32.add
        local.tee $3
        local.get $5
        i32.ne
        br_if $block_0
        local.get $5
        i32.load
        i32.const 2
        i32.and
        i32.const 1
        i32.or
        local.set $4
        local.get $3
        local.set $1
      end ;; $block_0
      block $block_1
        local.get $2
        local.get $1
        i32.sub
        local.tee $2
        i32.const 19
        i32.le_u
        br_if $block_1
        local.get $1
        i32.const 4
        i32.add
        local.tee $3
        i64.const 0
        i64.store align=4
        local.get $1
        local.get $4
        local.get $2
        i32.const -8
        i32.add
        local.tee $5
        i32.or
        i32.store
        local.get $3
        local.get $5
        i32.add
        local.tee $4
        i32.eqz
        br_if $block
        local.get $4
        i32.const 2
        i32.store
        local.get $0
        i32.load
        local.get $4
        i32.store offset=1568
        local.get $0
        i32.const 56
        i32.add
        local.tee $4
        local.get $4
        i64.load
        local.get $5
        i64.extend_i32_u
        i64.add
        i64.store
        local.get $0
        local.get $0
        i64.load offset=32
        local.get $2
        i64.extend_i32_u
        i64.add
        i64.store offset=32
        local.get $0
        local.get $1
        call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.insertBlock
        return
      end ;; $block_1
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.removeBlock (type $9)
    (param $0 i32)
    (param $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    block $block
      local.get $0
      i32.eqz
      br_if $block
      local.get $1
      i32.eqz
      br_if $block
      local.get $0
      i32.load
      local.set $2
      block $block_0
        block $block_1
          local.get $1
          i32.load
          local.tee $3
          i32.const -4
          i32.and
          local.tee $0
          i32.const 256
          i32.ge_u
          br_if $block_1
          local.get $3
          i32.const 4
          i32.shr_u
          local.set $3
          i32.const 0
          local.set $4
          br $block_0
        end ;; $block_1
        local.get $0
        i32.const 1073741820
        local.get $0
        i32.const 1073741820
        i32.lt_u
        select
        local.set $0
        i32.const 16
        local.get $0
        i32.const 27
        local.get $0
        call $github.com/moontrade/memory/tlsf.clz
        local.tee $5
        i32.sub
        local.tee $3
        i32.shr_u
        i32.const 16
        i32.xor
        local.get $3
        i32.const 31
        i32.gt_u
        select
        local.set $3
        i32.const 24
        local.get $5
        i32.sub
        local.set $4
      end ;; $block_0
      local.get $1
      i32.load offset=8
      local.set $0
      block $block_2
        local.get $1
        i32.load offset=4
        local.tee $5
        i32.eqz
        br_if $block_2
        local.get $5
        local.get $0
        i32.store offset=8
      end ;; $block_2
      block $block_3
        local.get $0
        i32.eqz
        br_if $block_3
        local.get $0
        local.get $5
        i32.store offset=4
      end ;; $block_3
      block $block_4
        local.get $2
        local.get $4
        i32.const 4
        i32.shl
        local.get $3
        i32.add
        i32.const 2
        i32.shl
        i32.add
        i32.const 96
        i32.add
        local.tee $5
        i32.load
        local.get $1
        i32.ne
        br_if $block_4
        local.get $5
        local.get $0
        i32.store
        local.get $0
        br_if $block_4
        local.get $2
        local.get $4
        i32.const 2
        i32.shl
        i32.add
        i32.const 4
        i32.add
        local.tee $1
        local.get $1
        i32.load
        i32.const -1
        i32.const -2
        local.get $3
        i32.rotl
        local.get $3
        i32.const 31
        i32.gt_u
        select
        i32.and
        local.tee $1
        i32.store
        local.get $1
        br_if $block_4
        local.get $2
        i32.eqz
        br_if $block
        local.get $2
        local.get $2
        i32.load
        i32.const -1
        i32.const -2
        local.get $4
        i32.rotl
        local.get $4
        i32.const 31
        i32.gt_u
        select
        i32.and
        i32.store
      end ;; $block_4
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.insertBlock (type $9)
    (param $0 i32)
    (param $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    block $block
      local.get $0
      i32.eqz
      br_if $block
      local.get $1
      i32.eqz
      br_if $block
      local.get $1
      i32.load
      local.tee $2
      i32.const -4
      i32.and
      local.get $1
      i32.const 4
      i32.add
      local.tee $3
      i32.add
      local.tee $4
      i32.eqz
      br_if $block
      local.get $0
      i32.load
      local.set $5
      block $block_0
        local.get $4
        i32.load
        local.tee $6
        i32.const 1
        i32.and
        i32.eqz
        br_if $block_0
        local.get $0
        local.get $4
        call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.removeBlock
        local.get $1
        local.get $2
        local.get $6
        i32.const -4
        i32.and
        i32.add
        i32.const 4
        i32.add
        local.tee $2
        i32.store
        local.get $2
        i32.const -4
        i32.and
        local.get $3
        i32.add
        local.tee $4
        i32.eqz
        br_if $block
        local.get $4
        i32.load
        local.set $6
      end ;; $block_0
      block $block_1
        local.get $2
        i32.const 2
        i32.and
        i32.eqz
        br_if $block_1
        local.get $1
        i32.const -4
        i32.add
        i32.load
        local.tee $1
        i32.eqz
        br_if $block
        local.get $1
        i32.load
        local.set $3
        local.get $0
        local.get $1
        call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.removeBlock
        local.get $1
        local.get $3
        local.get $2
        i32.const 4
        i32.add
        i32.const -4
        i32.and
        i32.add
        local.tee $2
        i32.store
      end ;; $block_1
      local.get $4
      i32.const -4
      i32.add
      local.get $1
      i32.store
      local.get $4
      local.get $6
      i32.const 2
      i32.or
      i32.store
      block $block_2
        block $block_3
          local.get $2
          i32.const -4
          i32.and
          local.tee $4
          i32.const 256
          i32.ge_u
          br_if $block_3
          local.get $2
          i32.const 4
          i32.shr_u
          local.set $4
          i32.const 0
          local.set $2
          br $block_2
        end ;; $block_3
        local.get $4
        i32.const 1073741820
        local.get $4
        i32.const 1073741820
        i32.lt_u
        select
        local.set $2
        i32.const 16
        local.get $2
        i32.const 27
        local.get $2
        call $github.com/moontrade/memory/tlsf.clz
        local.tee $0
        i32.sub
        local.tee $4
        i32.shr_u
        i32.const 16
        i32.xor
        local.get $4
        i32.const 31
        i32.gt_u
        select
        local.set $4
        i32.const 24
        local.get $0
        i32.sub
        local.set $2
      end ;; $block_2
      local.get $1
      local.get $5
      local.get $2
      i32.const 4
      i32.shl
      local.get $4
      i32.add
      i32.const 2
      i32.shl
      i32.add
      i32.const 96
      i32.add
      local.tee $6
      i32.load
      local.tee $0
      i32.store offset=8
      local.get $1
      i32.const 0
      i32.store offset=4
      block $block_4
        local.get $0
        i32.eqz
        br_if $block_4
        local.get $0
        local.get $1
        i32.store offset=4
      end ;; $block_4
      local.get $6
      local.get $1
      i32.store
      local.get $5
      i32.eqz
      br_if $block
      local.get $5
      local.get $5
      i32.load
      i32.const 0
      i32.const 1
      local.get $2
      i32.shl
      local.get $2
      i32.const 31
      i32.gt_u
      select
      i32.or
      i32.store
      local.get $5
      local.get $2
      i32.const 2
      i32.shl
      i32.add
      i32.const 4
      i32.add
      local.tee $1
      local.get $1
      i32.load
      i32.const 0
      i32.const 1
      local.get $4
      i32.shl
      local.get $4
      i32.const 31
      i32.gt_u
      select
      i32.or
      i32.store
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $runtime.nilPanic (type $5)
    i32.const 65912
    i32.const 23
    call $runtime.runtimePanic
    )
  
  (func $runtime.lookupPanic (type $5)
    i32.const 65957
    i32.const 18
    call $runtime.runtimePanic
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.AllocZeroed (type $3)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    block $block
      local.get $0
      local.get $1
      call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.allocateBlock
      local.tee $0
      br_if $block
      i32.const 0
      return
    end ;; $block
    local.get $0
    i32.const 4
    i32.add
    i32.const 0
    local.get $1
    call $memset
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free (type $9)
    (param $0 i32)
    (param $1 i32)
    local.get $0
    local.get $1
    call $github.com/moontrade/memory/tlsf.checkUsedBlock
    call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.freeBlock
    )
  
  (func $github.com/moontrade/memory/tlsf.checkUsedBlock (type $7)
    (param $0 i32)
    (result i32)
    block $block
      block $block_0
        block $block_1
          local.get $0
          i32.eqz
          br_if $block_1
          local.get $0
          i32.const 15
          i32.and
          br_if $block_1
          local.get $0
          i32.const -4
          i32.add
          local.tee $0
          i32.eqz
          br_if $block_0
          local.get $0
          i32.load8_u
          i32.const 1
          i32.and
          i32.eqz
          br_if $block
        end ;; $block_1
        i32.const 65840
        call $runtime._panic
        unreachable
      end ;; $block_0
      call $runtime.nilPanic
      unreachable
    end ;; $block
    local.get $0
    )
  
  (func $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.freeBlock (type $9)
    (param $0 i32)
    (param $1 i32)
    (local $2 i32)
    (local $3 i64)
    block $block
      local.get $1
      i32.eqz
      br_if $block
      local.get $0
      i32.eqz
      br_if $block
      local.get $0
      i32.const 56
      i32.add
      local.tee $2
      local.get $2
      i64.load
      local.get $1
      i64.load32_u
      i64.const 4294967292
      i64.and
      local.tee $3
      i64.add
      i64.store
      local.get $0
      i32.const 40
      i32.add
      local.tee $2
      local.get $2
      i64.load
      local.get $3
      i64.sub
      i64.store
      local.get $0
      i32.const 64
      i32.add
      local.tee $2
      local.get $2
      i32.load
      i32.const -1
      i32.add
      i32.store
      local.get $1
      local.get $1
      i32.load
      i32.const 1
      i32.or
      i32.store
      local.get $0
      local.get $1
      call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.insertBlock
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $_lparen_*internal/task.Queue_rparen_.Pop (type $10)
    (result i32)
    (local $0 i32)
    block $block
      i32.const 0
      i32.load offset=66664
      local.tee $0
      i32.eqz
      br_if $block
      i32.const 0
      local.get $0
      i32.load
      i32.store offset=66664
      block $block_0
        i32.const 0
        i32.load offset=66668
        local.get $0
        i32.ne
        br_if $block_0
        i32.const 0
        i32.const 0
        i32.store offset=66668
      end ;; $block_0
      local.get $0
      i32.const 0
      i32.store
      local.get $0
      return
    end ;; $block
    i32.const 0
    )
  
  (func $_lparen_*internal/task.Queue_rparen_.Push (type $9)
    (param $0 i32)
    (param $1 i32)
    (local $2 i32)
    block $block
      local.get $0
      i32.eqz
      br_if $block
      block $block_0
        local.get $0
        i32.load offset=4
        local.tee $2
        i32.eqz
        br_if $block_0
        local.get $2
        local.get $1
        i32.store
      end ;; $block_0
      local.get $0
      local.get $1
      i32.store offset=4
      local.get $1
      i32.eqz
      br_if $block
      local.get $1
      i32.const 0
      i32.store
      block $block_1
        local.get $0
        i32.load
        br_if $block_1
        local.get $0
        local.get $1
        i32.store
      end ;; $block_1
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $_lparen_*internal/task.Task_rparen_.setState (type $3)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    (local $2 i32)
    block $block
      local.get $0
      br_if $block
      call $runtime.nilPanic
      unreachable
    end ;; $block
    local.get $0
    i32.load offset=16
    local.set $2
    local.get $0
    local.get $1
    i32.store offset=16
    local.get $2
    )
  
  (func $internal/task.createTask (type $10)
    (result i32)
    (local $0 i32)
    i32.const 24
    call $runtime.alloc
    local.tee $0
    i32.const 66328
    i32.store offset=16
    local.get $0
    )
  
  (func $runtime.alloc (type $7)
    (param $0 i32)
    (result i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    block $block
      block $block_0
        local.get $0
        i32.const 1073741805
        i32.ge_u
        br_if $block_0
        i32.const 0
        i32.load offset=66704
        local.tee $1
        i32.eqz
        br_if $block
        block $block_1
          local.get $1
          i32.load offset=40
          local.get $0
          i32.const 16
          i32.add
          call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.AllocZeroed
          local.tee $2
          i32.const -4
          i32.add
          local.tee $3
          br_if $block_1
          i32.const 0
          return
        end ;; $block_1
        local.get $3
        i32.const 0
        i32.store offset=4
        local.get $3
        local.get $0
        i32.store offset=8
        local.get $1
        i32.const 352
        i32.add
        local.tee $4
        local.get $3
        i32.load
        i32.const 4
        i32.add
        i32.const -4
        i32.and
        local.get $4
        i32.load
        i32.add
        i32.store
        local.get $3
        i32.load
        local.set $4
        local.get $1
        i32.const 80
        i32.add
        local.tee $5
        local.get $5
        i64.load
        i64.const 1
        i64.add
        i64.store
        local.get $1
        i32.const 88
        i32.add
        local.tee $5
        local.get $5
        i64.load
        i64.const 1
        i64.add
        i64.store
        local.get $1
        i32.const 96
        i32.add
        local.tee $5
        local.get $5
        i64.load
        local.get $4
        i32.const 4
        i32.add
        i32.const -4
        i32.and
        i64.extend_i32_u
        i64.add
        i64.store
        local.get $3
        i32.const 20
        i32.add
        i32.const 0
        local.get $0
        call $memset
        drop
        local.get $1
        local.get $3
        i32.const 0
        call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Add
        drop
        block $block_2
          local.get $3
          local.get $1
          i32.load offset=32
          i32.ge_u
          br_if $block_2
          local.get $1
          local.get $3
          i32.store offset=32
        end ;; $block_2
        block $block_3
          local.get $3
          local.get $1
          i32.load offset=36
          i32.le_u
          br_if $block_3
          local.get $1
          local.get $3
          i32.store offset=36
        end ;; $block_3
        local.get $2
        i32.const 16
        i32.add
        return
      end ;; $block_0
      i32.const 66056
      call $runtime._panic
      unreachable
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Add (type $6)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (result i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i32)
    (local $8 i32)
    (local $9 f32)
    global.get $15
    i32.const 32
    i32.sub
    local.tee $3
    global.set $15
    block $block
      local.get $0
      i32.eqz
      br_if $block
      i32.const 0
      local.set $4
      local.get $1
      call $github.com/moontrade/memory/hash.FNV32a
      local.get $0
      i32.load offset=8
      i32.rem_u
      i32.const 3
      i32.shl
      local.get $0
      i32.load
      i32.add
      local.tee $5
      local.set $6
      block $block_0
        block $block_1
          loop $loop
            local.get $6
            i32.eqz
            br_if $block
            local.get $6
            i32.load
            local.tee $7
            i32.eqz
            br_if $block_0
            block $block_2
              local.get $7
              local.get $1
              i32.eq
              br_if $block_2
              block $block_3
                block $block_4
                  local.get $6
                  i32.load offset=4
                  local.tee $8
                  local.get $4
                  i32.ge_s
                  br_if $block_4
                  local.get $6
                  local.get $4
                  i32.store offset=4
                  local.get $6
                  local.get $1
                  i32.store
                  local.get $7
                  local.set $1
                  br $block_3
                end ;; $block_4
                local.get $4
                local.set $8
              end ;; $block_3
              block $block_5
                local.get $6
                i32.const 8
                i32.add
                local.tee $6
                local.get $0
                i32.load offset=4
                i32.lt_u
                br_if $block_5
                local.get $0
                i32.load
                local.set $6
              end ;; $block_5
              local.get $6
              local.get $5
              i32.eq
              br_if $block_1
              local.get $8
              i32.const 1
              i32.add
              local.tee $4
              local.get $0
              i32.load offset=20
              i32.gt_s
              br_if $block_1
              br $loop
            end ;; $block_2
          end ;; $loop
          local.get $6
          local.get $4
          i32.store offset=4
          local.get $3
          i32.const 32
          i32.add
          global.set $15
          i32.const 1
          return
        end ;; $block_1
        block $block_6
          local.get $2
          i32.const 6
          i32.ge_s
          br_if $block_6
          block $block_7
            local.get $0
            f32.load offset=28
            local.tee $9
            f32.const 0x1.000000p-0
            f32.le
            i32.const 1
            i32.xor
            br_if $block_7
            local.get $0
            i32.const 1073741824
            i32.store offset=28
            f32.const 0x1.000000p+1
            local.set $9
          end ;; $block_7
          i32.const -1
          i32.const 0
          local.get $9
          local.get $0
          i32.load offset=8
          f32.convert_i32_u
          f32.mul
          local.tee $9
          f32.const 0x0.000000p-127
          f32.ge
          local.tee $6
          select
          local.set $4
          local.get $9
          f32.const 0x1.fffffcp+31
          f32.le
          local.set $7
          block $block_8
            block $block_9
              local.get $9
              f32.const 0x1.000000p+32
              f32.lt
              local.get $6
              i32.and
              i32.eqz
              br_if $block_9
              local.get $9
              i32.trunc_f32_u
              local.set $8
              br $block_8
            end ;; $block_9
            i32.const 0
            local.set $8
          end ;; $block_8
          local.get $0
          i32.load offset=16
          local.get $8
          local.get $4
          local.get $7
          select
          local.get $4
          local.get $6
          select
          local.tee $4
          i32.const 3
          i32.shl
          local.tee $7
          call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.AllocZeroed
          local.set $6
          local.get $3
          i32.const 0
          i32.store offset=24
          local.get $3
          local.get $4
          i32.store offset=8
          local.get $3
          local.get $6
          i32.store
          local.get $3
          i32.const 0
          i32.store offset=12
          local.get $3
          local.get $7
          local.get $6
          i32.add
          i32.store offset=4
          local.get $3
          local.get $0
          i32.load offset=28
          i32.store offset=28
          local.get $3
          local.get $0
          i64.load offset=16 align=4
          i64.store offset=16 align=4
          local.get $0
          i32.load
          local.set $6
          block $block_10
            loop $loop_0
              local.get $6
              local.get $0
              i32.load offset=4
              i32.ge_u
              br_if $block_10
              local.get $6
              i32.load
              local.set $4
              local.get $6
              i32.const 8
              i32.add
              local.set $6
              local.get $3
              local.get $4
              i32.const 0
              call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Add
              i32.const 1
              i32.and
              i32.eqz
              br_if $block_6
              br $loop_0
            end ;; $loop_0
          end ;; $block_10
          local.get $0
          i32.load offset=16
          local.get $0
          i32.load
          call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
          local.get $0
          local.get $3
          i64.load offset=24 align=4
          i64.store offset=24 align=4
          local.get $0
          local.get $3
          i64.load offset=16 align=4
          i64.store offset=16 align=4
          local.get $0
          local.get $3
          i64.load offset=8 align=4
          i64.store offset=8 align=4
          local.get $0
          local.get $3
          i64.load align=4
          i64.store align=4
          local.get $0
          local.get $1
          local.get $2
          i32.const 1
          i32.add
          call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Add
          local.set $6
          local.get $3
          i32.const 32
          i32.add
          global.set $15
          local.get $6
          return
        end ;; $block_6
        local.get $3
        i32.const 32
        i32.add
        global.set $15
        i32.const 0
        return
      end ;; $block_0
      local.get $6
      local.get $4
      i32.store offset=4
      local.get $6
      local.get $1
      i32.store
      local.get $0
      local.get $0
      i32.load offset=12
      i32.const 1
      i32.add
      i32.store offset=12
      local.get $3
      i32.const 32
      i32.add
      global.set $15
      i32.const 1
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $runtime.slicePanic (type $5)
    i32.const 65975
    i32.const 18
    call $runtime.runtimePanic
    )
  
  (func $runtime.runtimePanic (type $9)
    (param $0 i32)
    (param $1 i32)
    i32.const 65935
    i32.const 22
    call $runtime.printstring
    local.get $0
    local.get $1
    call $runtime.printstring
    call $runtime.printnl
    unreachable
    unreachable
    )
  
  (func $runtime.printstring (type $9)
    (param $0 i32)
    (param $1 i32)
    local.get $1
    i32.const 0
    local.get $1
    i32.const 0
    i32.gt_s
    select
    local.set $1
    block $block
      loop $loop
        local.get $1
        i32.eqz
        br_if $block
        local.get $0
        i32.load8_u
        call $runtime.putchar
        local.get $0
        i32.const 1
        i32.add
        local.set $0
        local.get $1
        i32.const -1
        i32.add
        local.set $1
        br $loop
      end ;; $loop
    end ;; $block
    )
  
  (func $runtime.printnl (type $5)
    i32.const 13
    call $runtime.putchar
    i32.const 10
    call $runtime.putchar
    )
  
  (func $runtime.putchar (type $0)
    (param $0 i32)
    (local $1 i32)
    (local $2 i32)
    block $block
      i32.const 0
      i32.load offset=66404
      local.tee $1
      i32.const 255
      i32.le_u
      br_if $block
      call $runtime.lookupPanic
      unreachable
    end ;; $block
    i32.const 0
    local.get $1
    i32.const 1
    i32.add
    local.tee $2
    i32.store offset=66404
    local.get $1
    i32.const 66408
    i32.add
    local.get $0
    i32.store8
    block $block_0
      block $block_1
        local.get $0
        i32.const 255
        i32.and
        i32.const 10
        i32.eq
        br_if $block_1
        local.get $1
        i32.const 255
        i32.ne
        br_if $block_0
      end ;; $block_1
      i32.const 0
      local.get $2
      i32.store offset=66360
      i32.const 1
      i32.const 66356
      i32.const 1
      i32.const 66676
      call $runtime.fd_write
      drop
      i32.const 0
      i32.const 0
      i32.store offset=66404
    end ;; $block_0
    )
  
  (func $_lparen_*runtime.channel_rparen_.pop (type $7)
    (param $0 i32)
    (result i32)
    (local $1 i32)
    (local $2 i32)
    block $block
      i32.const 0
      i32.load offset=66388
      br_if $block
      i32.const 0
      return
    end ;; $block
    local.get $0
    i32.const 0
    i32.load offset=66392
    i32.const 0
    i32.load offset=66384
    i32.const 0
    i32.load offset=66364
    local.tee $1
    i32.mul
    i32.add
    local.tee $2
    local.get $1
    call $memcpy
    drop
    local.get $2
    i32.const 0
    i32.const 0
    i32.load offset=66364
    call $memset
    drop
    i32.const 0
    i32.const 0
    i32.load offset=66388
    i32.const -1
    i32.add
    i32.store offset=66388
    i32.const 0
    i32.const 0
    i32.const 0
    i32.load offset=66384
    i32.const 1
    i32.add
    local.tee $0
    local.get $0
    i32.const 0
    i32.load offset=66368
    i32.eq
    select
    i32.store offset=66384
    i32.const 1
    )
  
  (func $_lparen_*runtime.channel_rparen_.resumeTX (type $10)
    (result i32)
    (local $0 i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i32)
    (local $8 i32)
    (local $9 i32)
    (local $10 i32)
    (local $11 i32)
    (local $12 i32)
    block $block
      block $block_0
        i32.const 0
        i32.load offset=66376
        local.tee $0
        i32.eqz
        br_if $block_0
        i32.const 0
        local.get $0
        i32.load
        i32.store offset=66376
        local.get $0
        i32.load offset=4
        local.tee $1
        i32.eqz
        br_if $block_0
        block $block_1
          local.get $0
          i32.load offset=8
          local.tee $2
          br_if $block_1
          local.get $1
          i32.load offset=4
          local.set $3
          br $block
        end ;; $block_1
        local.get $2
        i32.load offset=4
        local.set $3
        local.get $1
        local.get $2
        i32.store offset=4
        local.get $0
        i32.load offset=12
        local.tee $4
        i32.eqz
        br_if $block
        i32.const -1
        local.set $5
        local.get $0
        i32.const 16
        i32.add
        i32.load
        local.tee $2
        i32.const 0
        local.get $2
        i32.const 0
        i32.gt_s
        select
        i32.const -1
        i32.add
        local.set $6
        local.get $2
        i32.const -1
        i32.add
        local.set $7
        loop $loop
          local.get $5
          local.get $6
          i32.eq
          br_if $block
          block $block_2
            block $block_3
              local.get $5
              local.get $7
              i32.eq
              br_if $block_3
              local.get $5
              i32.const 1
              i32.add
              local.tee $5
              local.get $0
              i32.load offset=16
              i32.ge_u
              br_if $block_3
              local.get $0
              i32.load offset=12
              local.tee $8
              local.get $5
              i32.const 24
              i32.mul
              local.tee $2
              i32.add
              local.tee $9
              local.get $0
              i32.eq
              br_if $loop
              local.get $4
              local.get $2
              i32.add
              local.tee $2
              i32.load offset=4
              i32.eqz
              br_if $loop
              local.get $2
              i32.load offset=8
              local.tee $10
              i32.eqz
              br_if $block_0
              local.get $10
              i32.load
              local.tee $11
              i32.eqz
              br_if $block_0
              local.get $11
              i32.load offset=12
              local.tee $12
              local.set $2
              block $block_4
                block $block_5
                  local.get $12
                  local.get $9
                  i32.ne
                  br_if $block_5
                  local.get $8
                  i32.eqz
                  br_if $block_0
                  local.get $9
                  i32.load
                  local.set $12
                  br $block_4
                end ;; $block_5
                loop $loop_0
                  local.get $2
                  local.tee $1
                  i32.eqz
                  br_if $block_4
                  local.get $1
                  i32.load
                  local.tee $2
                  local.get $9
                  i32.ne
                  br_if $loop_0
                end ;; $loop_0
                local.get $8
                i32.eqz
                br_if $block_0
                local.get $1
                local.get $9
                i32.load
                i32.store
              end ;; $block_4
              local.get $11
              local.get $12
              i32.store offset=12
              local.get $10
              i32.load
              local.tee $2
              i32.eqz
              br_if $block_0
              local.get $2
              i32.load offset=12
              br_if $loop
              block $block_6
                local.get $10
                i32.load offset=4
                br_if $block_6
                local.get $2
                i32.load8_u offset=8
                i32.const 4
                i32.eq
                br_if $loop
                br $block_2
              end ;; $block_6
              local.get $2
              i32.load offset=24
              i32.eqz
              br_if $block_2
              local.get $2
              i32.const 3
              i32.store8 offset=8
              br $loop
            end ;; $block_3
            call $runtime.lookupPanic
            unreachable
          end ;; $block_2
          local.get $2
          i32.const 0
          i32.store8 offset=8
          br $loop
        end ;; $loop
      end ;; $block_0
      call $runtime.nilPanic
      unreachable
    end ;; $block
    i32.const 66664
    local.get $0
    i32.load offset=4
    call $_lparen_*internal/task.Queue_rparen_.Push
    local.get $3
    )
  
  (func $runtime.printitf (type $0)
    (param $0 i32)
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $runtime.printstring
    )
  
  (func $runtime.printint64 (type $4)
    (param $0 i64)
    block $block
      local.get $0
      i64.const -1
      i64.gt_s
      br_if $block
      i32.const 45
      call $runtime.putchar
      i64.const 0
      local.get $0
      i64.sub
      local.set $0
    end ;; $block
    local.get $0
    call $runtime.printuint64
    )
  
  (func $runtime.printuint64 (type $4)
    (param $0 i64)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i64)
    (local $5 i32)
    global.get $15
    i32.const 32
    i32.sub
    local.tee $1
    global.set $15
    local.get $1
    i32.const 24
    i32.add
    i32.const 0
    i32.store
    local.get $1
    i32.const 16
    i32.add
    i64.const 0
    i64.store
    local.get $1
    i64.const 0
    i64.store offset=8
    i32.const 19
    local.set $2
    i32.const 19
    local.set $3
    loop $loop
      block $block
        local.get $3
        i32.const -1
        i32.gt_s
        br_if $block
        local.get $2
        i32.const 20
        local.get $2
        i32.const 20
        i32.gt_s
        select
        local.get $2
        i32.sub
        local.set $3
        local.get $1
        i32.const 8
        i32.add
        local.get $2
        i32.add
        local.set $2
        block $block_0
          loop $loop_0
            local.get $3
            i32.eqz
            br_if $block_0
            local.get $2
            i32.load8_u
            call $runtime.putchar
            local.get $2
            i32.const 1
            i32.add
            local.set $2
            local.get $3
            i32.const -1
            i32.add
            local.set $3
            br $loop_0
          end ;; $loop_0
        end ;; $block_0
        local.get $1
        i32.const 32
        i32.add
        global.set $15
        return
      end ;; $block
      local.get $1
      i32.const 8
      i32.add
      local.get $3
      i32.add
      local.get $0
      local.get $0
      i64.const 10
      i64.div_u
      local.tee $4
      i64.const 10
      i64.mul
      i64.sub
      i32.wrap_i64
      i32.const 48
      i32.or
      local.tee $5
      i32.store8
      local.get $2
      local.get $3
      local.get $5
      i32.const 255
      i32.and
      i32.const 48
      i32.eq
      select
      local.set $2
      local.get $3
      i32.const -1
      i32.add
      local.set $3
      local.get $4
      local.set $0
      br $loop
    end ;; $loop
    )
  
  (func $runtime.chanRecv (type $11)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (param $3 i32)
    (param $4 i32)
    (result i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i32)
    (local $8 i32)
    (local $9 i32)
    (local $10 i32)
    i32.const 24
    call $runtime.alloc
    local.tee $5
    local.get $4
    i32.store offset=8
    local.get $5
    i32.const 1
    i32.store offset=4
    local.get $5
    i32.const 2
    i32.store
    local.get $5
    local.get $4
    local.get $5
    call $_lparen_*internal/task.Task_rparen_.setState
    local.tee $6
    i32.store offset=12
    block $block
      local.get $4
      i32.eqz
      br_if $block
      local.get $5
      local.get $4
      i32.load offset=4
      local.tee $7
      i32.store offset=16
      i32.const 0
      local.set $8
      i32.const 0
      local.set $9
      block $block_0
        block $block_1
          block $block_2
            block $block_3
              block $block_4
                block $block_5
                  block $block_6
                    block $block_7
                      i32.const 0
                      i32.load8_u offset=66372
                      br_table
                        $block_0 $block_0 $block_6 $block_6 $block_3
                        $block_7 ;; default
                    end ;; $block_7
                    i32.const 65993
                    i32.const 21
                    call $runtime.runtimePanic
                    i32.const 66014
                    i32.const 11
                    call $runtime.runtimePanic
                    i32.const 0
                    local.set $8
                    br $block_5
                  end ;; $block_6
                  local.get $1
                  call $_lparen_*runtime.channel_rparen_.pop
                  local.set $10
                  i32.const 0
                  local.set $8
                  i32.const 0
                  i32.load offset=66376
                  local.set $9
                  local.get $10
                  i32.const 1
                  i32.and
                  br_if $block_2
                  local.get $9
                  br_if $block_4
                end ;; $block_5
                i32.const 0
                local.set $9
                br $block_0
              end ;; $block_4
              local.get $1
              call $_lparen_*runtime.channel_rparen_.resumeTX
              i32.const 0
              i32.load offset=66364
              call $memcpy
              drop
              i32.const 1
              local.set $8
              i32.const 1
              local.set $9
              i32.const 0
              i32.load offset=66376
              br_if $block_0
              i32.const 0
              i32.const 0
              i32.store8 offset=66372
              br $block_1
            end ;; $block_3
            i32.const 1
            local.set $8
            i32.const 1
            local.set $9
            local.get $1
            call $_lparen_*runtime.channel_rparen_.pop
            i32.const 1
            i32.and
            br_if $block_0
            i32.const 0
            local.set $9
            local.get $1
            i32.const 0
            i32.const 0
            i32.load offset=66364
            call $memset
            drop
            i32.const 1
            local.set $8
            br $block_0
          end ;; $block_2
          block $block_8
            block $block_9
              local.get $9
              br_if $block_9
              i32.const 0
              i32.load offset=66388
              local.set $10
              br $block_8
            end ;; $block_9
            call $_lparen_*runtime.channel_rparen_.resumeTX
            local.set $9
            i32.const 0
            i32.load offset=66388
            local.set $10
            block $block_10
              i32.const 0
              i32.load offset=66368
              local.tee $8
              i32.eqz
              br_if $block_10
              local.get $10
              local.get $8
              i32.eq
              br_if $block_10
              i32.const 0
              i32.load offset=66392
              i32.const 0
              i32.load offset=66380
              i32.const 0
              i32.load offset=66364
              local.tee $8
              i32.mul
              i32.add
              local.get $9
              local.get $8
              call $memcpy
              drop
              i32.const 0
              i32.const 0
              i32.load offset=66388
              i32.const 1
              i32.add
              local.tee $10
              i32.store offset=66388
              i32.const 0
              i32.const 0
              i32.const 0
              i32.load offset=66380
              i32.const 1
              i32.add
              local.tee $8
              local.get $8
              i32.const 0
              i32.load offset=66368
              i32.eq
              select
              i32.store offset=66380
            end ;; $block_10
            i32.const 0
            i32.load offset=66376
            br_if $block_8
            i32.const 0
            i32.const 3
            i32.store8 offset=66372
          end ;; $block_8
          i32.const 1
          local.set $8
          i32.const 1
          local.set $9
          local.get $10
          br_if $block_0
          i32.const 0
          i32.const 0
          i32.store8 offset=66372
        end ;; $block_1
        i32.const 1
        local.set $8
        i32.const 1
        local.set $9
      end ;; $block_0
      block $block_11
        local.get $8
        i32.const 1
        i32.and
        i32.eqz
        br_if $block_11
        local.get $7
        local.get $9
        i32.const 1
        i32.and
        i32.store8
        local.get $4
        local.get $6
        i32.store offset=16
        i32.const 66664
        local.get $4
        call $_lparen_*internal/task.Queue_rparen_.Push
        local.get $5
        call $runtime.free
        local.get $4
        return
      end ;; $block_11
      i32.const 0
      i32.const 1
      i32.store8 offset=66372
      local.get $4
      i64.const 1
      i64.store offset=8
      local.get $4
      local.get $1
      i32.store offset=4
      local.get $2
      i32.eqz
      br_if $block
      i32.const 0
      i32.load offset=66376
      local.set $8
      local.get $2
      local.get $4
      i32.store offset=4
      local.get $2
      local.get $8
      i32.store
      local.get $2
      i32.const 16
      i32.add
      i64.const 0
      i64.store align=4
      local.get $2
      i64.const 0
      i64.store offset=8 align=4
      local.get $5
      i32.const 0
      i32.store8 offset=20
      i32.const 0
      local.get $2
      i32.store offset=66376
      local.get $4
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $runtime.chanRecv.destroy (type $0)
    (param $0 i32)
    local.get $0
    call $runtime.free
    )
  
  (func $runtime.chanRecv.resume (type $0)
    (param $0 i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i64)
    local.get $0
    i32.load offset=12
    local.set $1
    local.get $0
    i32.load offset=16
    local.set $2
    local.get $0
    i32.load offset=8
    local.tee $3
    i32.const 0
    i32.store offset=4
    local.get $3
    i64.load offset=8
    local.set $4
    local.get $3
    i64.const 0
    i64.store offset=8
    local.get $2
    local.get $4
    i64.const 1
    i64.eq
    i32.store8
    local.get $3
    local.get $1
    i32.store offset=16
    i32.const 66664
    local.get $3
    call $_lparen_*internal/task.Queue_rparen_.Push
    local.get $0
    call $runtime.free
    )
  
  (func $runtime.free (type $0)
    (param $0 i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    i32.const 66302
    i32.const 6
    call $runtime.printstring
    i32.const 32
    call $runtime.putchar
    local.get $0
    i64.extend_i32_u
    call $runtime.printuint64
    call $runtime.printnl
    block $block
      i32.const 0
      i32.load offset=66704
      local.tee $1
      i32.eqz
      br_if $block
      block $block_0
        local.get $1
        local.get $0
        i32.const -20
        i32.add
        local.tee $2
        call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Delete
        i32.const 1
        i32.and
        i32.eqz
        br_if $block_0
        local.get $2
        call $_lparen_*github.com/moontrade/memory/alloc.gcObject_rparen_.size
        local.set $2
        local.get $1
        i32.const 352
        i32.add
        local.tee $3
        local.get $3
        i32.load
        local.get $2
        i32.sub
        i32.store
        local.get $1
        i32.const 112
        i32.add
        local.tee $3
        local.get $3
        i64.load
        local.get $2
        i64.extend_i32_u
        i64.add
        i64.store
        local.get $1
        i32.const 80
        i32.add
        local.tee $2
        local.get $2
        i64.load
        i64.const -1
        i64.add
        i64.store
        local.get $1
        i32.const 104
        i32.add
        local.tee $2
        local.get $2
        i64.load
        i64.const 1
        i64.add
        i64.store
        local.get $1
        i32.load offset=40
        local.get $0
        i32.const -16
        i32.add
        call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
      end ;; $block_0
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Delete (type $3)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    block $block
      block $block_0
        block $block_1
          local.get $1
          i32.eqz
          br_if $block_1
          local.get $0
          i32.eqz
          br_if $block
          local.get $1
          call $github.com/moontrade/memory/hash.FNV32a
          local.get $0
          i32.load offset=8
          i32.rem_u
          i32.const 3
          i32.shl
          local.get $0
          i32.load
          local.tee $2
          i32.add
          local.tee $3
          local.set $4
          loop $loop
            local.get $4
            i32.eqz
            br_if $block
            local.get $4
            i32.load
            local.tee $5
            i32.eqz
            br_if $block_1
            block $block_2
              local.get $5
              local.get $1
              i32.ne
              br_if $block_2
              br $block_0
            end ;; $block_2
            local.get $4
            i32.const 8
            i32.add
            local.tee $4
            local.get $2
            local.get $4
            local.get $0
            i32.load offset=4
            i32.lt_u
            select
            local.tee $4
            local.get $3
            i32.ne
            br_if $loop
          end ;; $loop
        end ;; $block_1
        i32.const 0
        return
      end ;; $block_0
      block $block_3
        loop $loop_0
          block $block_4
            local.get $4
            i32.const 8
            i32.add
            local.tee $5
            local.get $0
            i32.load offset=4
            i32.lt_u
            br_if $block_4
            local.get $0
            i32.load
            local.tee $5
            local.get $4
            i32.eq
            br_if $block_3
          end ;; $block_4
          local.get $5
          i32.eqz
          br_if $block
          local.get $5
          i32.load
          i32.eqz
          br_if $block_3
          local.get $5
          i32.load offset=4
          local.tee $1
          i32.const 1
          i32.lt_s
          br_if $block_3
          local.get $5
          local.get $1
          i32.const -1
          i32.add
          i32.store offset=4
          local.get $4
          local.get $5
          i64.load align=4
          i64.store align=4
          local.get $5
          local.set $4
          br $loop_0
        end ;; $loop_0
      end ;; $block_3
      local.get $4
      i64.const 0
      i64.store align=4
      local.get $0
      local.get $0
      i32.load offset=12
      i32.const -1
      i32.add
      i32.store offset=12
      i32.const 1
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $_lparen_*github.com/moontrade/memory/alloc.gcObject_rparen_.size (type $7)
    (param $0 i32)
    (result i32)
    block $block
      local.get $0
      br_if $block
      call $runtime.nilPanic
      unreachable
    end ;; $block
    local.get $0
    i32.load
    i32.const 4
    i32.add
    i32.const -4
    i32.and
    )
  
  (func $runtime.ticks (type $12)
    (result i64)
    (local $0 i32)
    (local $1 i64)
    global.get $15
    i32.const 16
    i32.sub
    local.tee $0
    global.set $15
    local.get $0
    i64.const 0
    i64.store offset=8
    i32.const 0
    i64.const 1000
    local.get $0
    i32.const 8
    i32.add
    call $runtime.clock_time_get
    drop
    local.get $0
    i64.load offset=8
    local.set $1
    local.get $0
    i32.const 16
    i32.add
    global.set $15
    local.get $1
    )
  
  (func $_start (type $5)
    (local $0 i32)
    (local $1 i64)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    global.get $15
    i32.const 16
    i32.sub
    local.tee $0
    global.set $15
    i32.const 0
    memory.size
    i32.const 16
    i32.shl
    i32.store offset=66400
    call $__wasm_call_ctors
    i32.const 0
    i64.load32_u offset=66400
    local.set $1
    i32.const 66292
    i32.const 10
    call $runtime.printstring
    i32.const 32
    call $runtime.putchar
    i32.const 66716
    i64.extend_i32_u
    call $runtime.printuint64
    i32.const 32
    call $runtime.putchar
    local.get $1
    call $runtime.printuint64
    call $runtime.printnl
    block $block
      block $block_0
        i32.const 0
        i32.load offset=66696
        local.tee $2
        br_if $block_0
        block $block_1
          memory.size
          i32.const 16
          i32.shl
          local.tee $3
          i32.const 68407
          i32.ge_u
          br_if $block_1
          i32.const 1
          memory.grow
          drop
          memory.size
          i32.const 16
          i32.shl
          local.set $3
        end ;; $block_1
        i32.const 66719
        i32.const -4
        i32.and
        i32.const 0
        i32.const 96
        call $memset
        local.tee $4
        i32.const 80
        i32.add
        i32.const 1
        i32.store
        local.get $4
        i32.const 68
        i32.add
        i32.const 1
        i32.store
        local.get $4
        i32.const 8
        i32.add
        local.get $3
        i32.store
        local.get $4
        i32.const 4
        i32.add
        local.get $4
        i32.store
        local.get $4
        i32.const 20
        i32.add
        i32.const 1
        i32.store
        local.get $4
        local.get $4
        i32.const 15
        i32.add
        i32.const -16
        i32.and
        local.tee $5
        i32.const 88
        i32.add
        local.tee $2
        i32.store
        local.get $2
        i32.eqz
        br_if $block
        local.get $5
        i32.const 1656
        i32.add
        i32.const 0
        i32.store
        local.get $2
        i32.const 0
        i32.store
        local.get $5
        i32.const 184
        i32.add
        local.set $2
        i32.const 0
        local.set $6
        loop $loop
          block $block_2
            block $block_3
              local.get $6
              i32.const 23
              i32.eq
              br_if $block_3
              i32.const 0
              local.set $4
              local.get $5
              local.get $6
              i32.const 2
              i32.shl
              i32.add
              i32.const 92
              i32.add
              i32.const 0
              i32.store
              loop $loop_0
                local.get $4
                i32.const 64
                i32.eq
                br_if $block_2
                local.get $2
                local.get $4
                i32.add
                i32.const 0
                i32.store
                local.get $4
                i32.const 4
                i32.add
                local.set $4
                br $loop_0
              end ;; $loop_0
            end ;; $block_3
            i32.const 66719
            i32.const -4
            i32.and
            local.tee $2
            local.get $2
            i32.const 15
            i32.add
            i32.const -16
            i32.and
            i32.const 1660
            i32.add
            local.get $3
            call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.addMemory
            i32.const 0
            i32.const 1
            i32.store8 offset=66700
            i32.const 0
            local.get $2
            i32.store offset=66696
            br $block_0
          end ;; $block_2
          local.get $2
          i32.const 64
          i32.add
          local.set $2
          local.get $6
          i32.const 1
          i32.add
          local.set $6
          br $loop
        end ;; $loop
      end ;; $block_0
      local.get $2
      i32.const 352
      call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc
      local.tee $4
      local.get $2
      i32.store offset=40
      local.get $2
      i32.const 512
      call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc
      i32.const 0
      i32.const 512
      call $memset
      local.set $6
      local.get $4
      i32.eqz
      br_if $block
      local.get $4
      i32.const 0
      i32.store offset=36
      local.get $4
      i64.const -3221225472
      i64.store offset=28 align=4
      local.get $4
      i64.const 274877906954
      i64.store offset=20 align=4
      local.get $4
      local.get $2
      i32.store offset=16
      local.get $4
      i64.const 64
      i64.store offset=8 align=4
      local.get $4
      local.get $6
      i32.store
      local.get $4
      i32.const 56
      i32.add
      i32.const 2
      i32.store
      local.get $4
      i32.const 48
      i32.add
      i32.const 1
      i32.store
      local.get $4
      local.get $6
      i32.const 512
      i32.add
      i32.store offset=4
      local.get $0
      call $time.Now
      i32.const 0
      local.get $4
      i32.store offset=66704
      local.get $4
      local.get $0
      i64.load
      local.tee $1
      i64.const 1073741823
      i64.and
      local.get $0
      i64.load offset=8
      local.get $1
      i64.const 30
      i64.shr_u
      i64.const 8589934591
      i64.and
      i64.const 59453308800
      i64.add
      local.get $1
      i64.const -1
      i64.gt_s
      select
      i64.const 1000000000
      i64.mul
      i64.add
      i64.const -6795364578871345152
      i64.add
      i64.store offset=64
      local.get $4
      call $internal/task.createTask
      call $runtime.run$1
      call $runtime.scheduler
      local.get $0
      i32.const 16
      i32.add
      global.set $15
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $time.Now (type $0)
    (param $0 i32)
    (local $1 i64)
    (local $2 i64)
    (local $3 i64)
    (local $4 i64)
    call $runtime.ticks
    local.tee $1
    i64.const 1000000000
    i64.div_s
    local.tee $2
    i64.const -1000000000
    i64.mul
    local.get $1
    i64.add
    local.set $3
    block $block
      local.get $2
      i64.const 2682288000
      i64.add
      local.tee $4
      i64.const 8589934592
      i64.lt_u
      br_if $block
      local.get $0
      local.get $2
      i64.const 62135596800
      i64.add
      i64.store offset=8
      local.get $0
      local.get $3
      i64.const 32
      i64.shl
      i64.const 32
      i64.shr_s
      i64.store
      return
    end ;; $block
    local.get $0
    local.get $1
    i64.const 1
    i64.add
    i64.store offset=8
    local.get $0
    local.get $4
    i64.const 30
    i64.shl
    local.get $3
    i64.const 32
    i64.shl
    i64.const 32
    i64.shr_s
    i64.or
    i64.const -9223372036854775808
    i64.or
    i64.store
    )
  
  (func $runtime.run$1 (type $9)
    (param $0 i32)
    (param $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i32)
    (local $8 i32)
    global.get $15
    i32.const 16
    i32.sub
    local.tee $2
    global.set $15
    i32.const 20
    call $runtime.alloc
    local.tee $3
    local.get $1
    i32.store offset=8
    local.get $3
    i32.const 3
    i32.store offset=4
    local.get $3
    i32.const 4
    i32.store
    local.get $3
    local.get $1
    local.get $3
    call $_lparen_*internal/task.Task_rparen_.setState
    i32.store offset=12
    i32.const 0
    memory.size
    i32.const 16
    i32.shl
    i32.store offset=66400
    local.get $2
    i32.const 0
    i32.store offset=12
    local.get $2
    i32.const 0
    i32.store offset=8
    local.get $2
    i32.const 12
    i32.add
    local.get $2
    i32.const 8
    i32.add
    call $runtime.args_sizes_get
    drop
    block $block
      block $block_0
        block $block_1
          local.get $2
          i32.load offset=12
          local.tee $4
          i32.eqz
          br_if $block_1
          local.get $4
          i32.const 0
          i32.lt_s
          br_if $block_0
          local.get $4
          i32.const 2
          i32.shl
          call $runtime.alloc
          local.set $5
          local.get $2
          i32.load offset=8
          local.tee $6
          i32.const -1
          i32.le_s
          br_if $block_0
          local.get $6
          call $runtime.alloc
          local.set $7
          local.get $6
          i32.eqz
          br_if $block
          local.get $5
          local.get $7
          call $runtime.args_get
          drop
          i32.const 0
          local.set $6
          local.get $4
          i32.const 3
          i32.shl
          call $runtime.alloc
          local.set $7
          i32.const 0
          local.get $4
          i32.store offset=66344
          i32.const 0
          local.get $4
          i32.store offset=66340
          i32.const 0
          local.get $7
          i32.store offset=66336
          loop $loop
            local.get $4
            local.get $6
            i32.eq
            br_if $block_1
            local.get $6
            local.get $4
            i32.ge_u
            br_if $block
            local.get $7
            i32.const 4
            i32.add
            local.get $5
            i32.load
            local.tee $8
            call $strlen
            i32.store
            local.get $7
            local.get $8
            i32.store
            local.get $5
            i32.const 4
            i32.add
            local.set $5
            local.get $7
            i32.const 8
            i32.add
            local.set $7
            local.get $6
            i32.const 1
            i32.add
            local.set $6
            br $loop
          end ;; $loop
        end ;; $block_1
        local.get $6
        local.get $1
        call $main.main
        local.get $3
        i32.const 0
        i32.store8 offset=16
        local.get $2
        i32.const 16
        i32.add
        global.set $15
        return
      end ;; $block_0
      call $runtime.slicePanic
      unreachable
    end ;; $block
    call $runtime.lookupPanic
    unreachable
    )
  
  (func $runtime.scheduler (type $5)
    (local $0 i64)
    (local $1 i32)
    (local $2 i64)
    (local $3 i64)
    i64.const 0
    local.set $0
    loop $loop
      block $block
        block $block_0
          i32.const 0
          i32.load8_u offset=66680
          br_if $block_0
          block $block_1
            i32.const 0
            i32.load offset=66672
            i32.eqz
            br_if $block_1
            call $runtime.ticks
            local.set $0
            i32.const 0
            i32.load offset=66672
            local.tee $1
            i32.eqz
            br_if $block_1
            local.get $0
            i32.const 0
            i64.load offset=66688
            local.tee $2
            i64.sub
            local.get $1
            i64.load offset=8
            local.tee $3
            i64.lt_s
            br_if $block_1
            i32.const 0
            local.get $3
            local.get $2
            i64.add
            i64.store offset=66688
            i32.const 0
            local.get $1
            i32.load
            i32.store offset=66672
            local.get $1
            i32.const 0
            i32.store
            i32.const 66664
            local.get $1
            call $_lparen_*internal/task.Queue_rparen_.Push
          end ;; $block_1
          call $_lparen_*internal/task.Queue_rparen_.Pop
          local.tee $1
          br_if $block
          i32.const 0
          i32.load offset=66672
          local.tee $1
          i32.eqz
          br_if $block_0
          local.get $1
          i64.load offset=8
          local.get $0
          i64.sub
          i32.const 0
          i64.load offset=66688
          i64.add
          call $setTimeout
        end ;; $block_0
        return
      end ;; $block
      local.get $1
      i32.load offset=16
      local.tee $1
      local.get $1
      i32.load
      call_indirect $13 (type $0)
      br $loop
    end ;; $loop
    )
  
  (func $runtime.run$1.destroy (type $0)
    (param $0 i32)
    local.get $0
    call $runtime.free
    )
  
  (func $runtime.run$1.resume (type $0)
    (param $0 i32)
    (local $1 i32)
    i32.const 0
    i32.const 1
    i32.store8 offset=66680
    block $block
      local.get $0
      i32.load offset=8
      local.tee $1
      br_if $block
      call $runtime.nilPanic
      unreachable
    end ;; $block
    local.get $1
    local.get $0
    i32.load offset=12
    i32.store offset=16
    i32.const 66664
    local.get $1
    call $_lparen_*internal/task.Queue_rparen_.Push
    local.get $0
    call $runtime.free
    )
  
  (func $main.main (type $9)
    (param $0 i32)
    (param $1 i32)
    (local $2 i32)
    i32.const 44
    call $runtime.alloc
    local.tee $2
    local.get $1
    i32.store offset=32
    local.get $2
    i32.const 5
    i32.store offset=4
    local.get $2
    i32.const 6
    i32.store
    local.get $2
    local.get $1
    local.get $2
    call $_lparen_*internal/task.Task_rparen_.setState
    i32.store offset=36
    i32.const 66308
    i32.const 13
    call $runtime.printstring
    call $runtime.printnl
    local.get $2
    call $internal/task.createTask
    call $main.main$1
    block $block
      local.get $1
      br_if $block
      call $runtime.nilPanic
      unreachable
    end ;; $block
    local.get $1
    local.get $2
    i32.const 41
    i32.add
    i32.store offset=4
    i32.const 66364
    local.get $2
    i32.const 42
    i32.add
    local.get $2
    i32.const 8
    i32.add
    local.get $2
    local.get $1
    call $runtime.chanRecv
    drop
    local.get $2
    i32.const 0
    i32.store8 offset=40
    )
  
  (func $resume (type $5)
    i32.const 0
    i32.const 0
    i32.store8 offset=66680
    call $runtime.scheduler
    )
  
  (func $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf (type $7)
    (param $0 i32)
    (result i32)
    block $block
      local.get $0
      i32.const -4
      i32.add
      local.tee $0
      br_if $block
      call $runtime.nilPanic
      unreachable
    end ;; $block
    local.get $0
    i32.load
    i32.const -4
    i32.and
    )
  
  (func $alloc (type $7)
    (param $0 i32)
    (result i32)
    i32.const 0
    i32.load offset=66696
    local.get $0
    call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.AllocZeroed
    )
  
  (func $realloc (type $3)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    (local $2 i32)
    (local $3 i32)
    i32.const 0
    local.set $2
    i32.const 0
    i32.load offset=66696
    local.set $3
    local.get $0
    call $github.com/moontrade/memory/tlsf.checkUsedBlock
    local.set $0
    block $block
      block $block_0
        local.get $3
        local.get $1
        call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.allocateBlock
        local.tee $1
        i32.eqz
        br_if $block_0
        local.get $0
        i32.eqz
        br_if $block
        local.get $1
        i32.const 4
        i32.add
        local.tee $2
        local.get $0
        i32.const 4
        i32.add
        local.get $0
        i32.load
        i32.const -4
        i32.and
        call $memcpy
        drop
        local.get $3
        local.get $0
        call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.freeBlock
      end ;; $block_0
      local.get $2
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $free (type $0)
    (param $0 i32)
    i32.const 0
    i32.load offset=66696
    local.get $0
    call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
    )
  
  (func $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRecursive (type $8)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (local $3 i32)
    (local $4 i32)
    block $block
      local.get $2
      i32.const 65
      i32.ge_s
      br_if $block
      local.get $1
      i32.load offset=4
      br_if $block
      local.get $1
      i32.const 1
      i32.store offset=4
      local.get $1
      i32.load offset=8
      local.tee $3
      i32.const 3
      i32.and
      br_if $block
      local.get $2
      i32.const 1
      i32.add
      local.set $4
      local.get $3
      local.get $1
      i32.const 20
      i32.add
      local.tee $2
      i32.add
      local.set $3
      loop $loop
        local.get $2
        local.get $3
        i32.ge_u
        br_if $block
        block $block_0
          local.get $0
          br_if $block_0
          call $runtime.nilPanic
          unreachable
        end ;; $block_0
        block $block_1
          local.get $2
          i32.load
          i32.const -20
          i32.add
          local.tee $1
          local.get $0
          i32.load offset=32
          i32.lt_u
          br_if $block_1
          local.get $1
          local.get $0
          i32.load offset=36
          i32.gt_u
          br_if $block_1
          local.get $0
          local.get $1
          call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Has
          i32.const 1
          i32.and
          i32.eqz
          br_if $block_1
          local.get $0
          local.get $1
          local.get $4
          call $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRecursive
        end ;; $block_1
        local.get $2
        i32.const 4
        i32.add
        local.set $2
        br $loop
      end ;; $loop
    end ;; $block
    )
  
  (func $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Has (type $3)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    block $block
      local.get $0
      i32.eqz
      br_if $block
      local.get $1
      call $github.com/moontrade/memory/hash.FNV32a
      local.get $0
      i32.load offset=8
      i32.rem_u
      i32.const 3
      i32.shl
      local.get $0
      i32.load
      local.tee $2
      i32.add
      local.tee $3
      local.set $4
      block $block_0
        loop $loop
          local.get $4
          i32.load
          local.tee $5
          i32.eqz
          br_if $block_0
          block $block_1
            local.get $5
            local.get $1
            i32.ne
            br_if $block_1
            i32.const 1
            return
          end ;; $block_1
          local.get $4
          i32.const 8
          i32.add
          local.tee $4
          local.get $2
          local.get $4
          local.get $0
          i32.load offset=4
          i32.lt_u
          select
          local.tee $4
          local.get $3
          i32.ne
          br_if $loop
        end ;; $loop
      end ;; $block_0
      i32.const 0
      return
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRoot (type $9)
    (param $0 i32)
    (param $1 i32)
    block $block
      local.get $0
      br_if $block
      call $runtime.nilPanic
      unreachable
    end ;; $block
    block $block_0
      local.get $0
      i32.load offset=32
      local.get $1
      i32.gt_u
      br_if $block_0
      local.get $0
      i32.load offset=36
      local.get $1
      i32.lt_u
      br_if $block_0
      local.get $0
      local.get $1
      i32.const -20
      i32.add
      local.tee $1
      call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Has
      i32.const 1
      i32.and
      i32.eqz
      br_if $block_0
      local.get $1
      i32.const 1
      i32.store offset=4
      return
    end ;; $block_0
    )
  
  (func $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRoots (type $8)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    block $block
      local.get $1
      i32.eqz
      br_if $block
      local.get $2
      local.get $1
      i32.le_u
      br_if $block
      local.get $2
      i32.const -4
      i32.and
      local.set $2
      local.get $1
      i32.const 3
      i32.add
      i32.const -4
      i32.and
      local.set $1
      loop $loop
        local.get $1
        local.get $2
        i32.ge_u
        br_if $block
        local.get $0
        local.get $1
        i32.load
        call $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRoot
        local.get $1
        i32.const 4
        i32.add
        local.set $1
        br $loop
      end ;; $loop
    end ;; $block
    )
  
  (func $github.com/moontrade/memory/alloc.doMarkStack (type $5)
    (local $0 i32)
    (local $1 i32)
    i32.const 0
    local.set $0
    block $block
      loop $loop
        local.get $0
        i32.load
        local.tee $0
        i32.eqz
        br_if $block
        i32.const 0
        i32.load offset=66704
        local.get $0
        i32.const 8
        i32.add
        local.tee $1
        local.get $1
        local.get $0
        i32.load offset=4
        i32.const 2
        i32.shl
        i32.add
        call $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRoots
        br $loop
      end ;; $loop
    end ;; $block
    )
  
  (func $github.com/moontrade/memory/alloc.doMarkGlobals (type $5)
    (local $0 i32)
    (local $1 i32)
    (local $2 i32)
    global.get $15
    i32.const 16
    i32.sub
    local.tee $0
    global.set $15
    i32.const 0
    i32.load offset=66704
    i32.const 65536
    i32.const 66716
    call $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRoots
    i32.const 66672
    local.set $1
    block $block
      loop $loop
        local.get $1
        i32.load
        local.tee $2
        i32.eqz
        br_if $block
        local.get $2
        call $runtime.gcMarkTask
        local.get $1
        i32.load
        local.tee $1
        br_if $loop
      end ;; $loop
      call $runtime.nilPanic
      unreachable
    end ;; $block
    local.get $0
    i64.const 0
    i64.store offset=8 align=4
    block $block_0
      loop $loop_0
        i32.const 0
        i32.load offset=66664
        i32.eqz
        br_if $block_0
        call $_lparen_*internal/task.Queue_rparen_.Pop
        local.tee $1
        call $runtime.gcMarkTask
        local.get $0
        i32.const 8
        i32.add
        local.get $1
        call $_lparen_*internal/task.Queue_rparen_.Push
        br $loop_0
      end ;; $loop_0
    end ;; $block_0
    i32.const 0
    local.get $0
    i64.load offset=8 align=4
    i64.store offset=66664
    local.get $0
    i32.const 16
    i32.add
    global.set $15
    )
  
  (func $runtime.gcMarkTask (type $0)
    (param $0 i32)
    i32.const 0
    i32.load offset=66704
    local.get $0
    call $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRoot
    )
  
  (func $stub (type $5)
    )
  
  (func $main.main.destroy (type $0)
    (param $0 i32)
    local.get $0
    call $runtime.free
    )
  
  (func $main.main.resume (type $0)
    (param $0 i32)
    (local $1 i32)
    block $block
      local.get $0
      i32.load offset=32
      local.tee $1
      br_if $block
      call $runtime.nilPanic
      unreachable
    end ;; $block
    local.get $1
    local.get $0
    i32.load offset=36
    i32.store offset=16
    i32.const 66664
    local.get $1
    call $_lparen_*internal/task.Queue_rparen_.Push
    local.get $0
    call $runtime.free
    )
  
  (func $main.main$1 (type $9)
    (param $0 i32)
    (param $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i32)
    (local $8 i64)
    (local $9 i64)
    (local $10 i64)
    (local $11 i64)
    (local $12 i32)
    (local $13 i64)
    (local $14 i64)
    (local $15 i64)
    (local $16 i32)
    (local $17 i64)
    global.get $15
    i32.const 80
    i32.sub
    local.tee $2
    global.set $15
    i32.const 16
    call $runtime.alloc
    local.tee $3
    local.get $1
    i32.store offset=8
    local.get $3
    i32.const 7
    i32.store offset=4
    local.get $3
    i32.const 8
    i32.store
    local.get $1
    local.get $3
    call $_lparen_*internal/task.Task_rparen_.setState
    drop
    block $block
      i32.const 66719
      i32.const -4
      i32.and
      i32.const 0
      i32.const 0
      i32.load8_u offset=66700
      select
      local.tee $4
      i32.const 156
      call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc
      local.tee $1
      i32.eqz
      br_if $block
      local.get $1
      i64.const 32
      i64.store offset=8 align=4
      local.get $1
      local.get $4
      i32.store offset=4
      local.get $1
      local.get $1
      i32.const 20
      i32.add
      i32.store
      local.get $1
      local.get $1
      call $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf
      i32.store offset=16
      local.get $1
      i32.load
      local.tee $4
      i32.eqz
      br_if $block
      local.get $4
      i64.const 0
      i64.store align=4
      local.get $1
      i32.load offset=4
      i32.const 512
      call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc
      local.set $5
      block $block_0
        local.get $1
        i32.load
        local.tee $4
        i32.eqz
        br_if $block_0
        block $block_1
          block $block_2
            local.get $4
            i32.load
            local.tee $6
            local.get $1
            i32.load offset=8
            i32.ne
            br_if $block_2
            local.get $1
            local.get $1
            i32.load offset=4
            local.get $6
            i32.const 2
            i32.shl
            i32.const 8
            i32.add
            call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc
            local.tee $6
            call $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf
            local.get $5
            call $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf
            i32.add
            local.get $1
            i32.load offset=16
            i32.add
            i32.store offset=16
            local.get $6
            i32.eqz
            br_if $block
            local.get $6
            local.get $4
            i32.store offset=4
            local.get $6
            i32.const 1
            i32.store
            local.get $1
            local.get $6
            i32.store
            local.get $6
            local.get $5
            i32.store offset=8
            br $block_1
          end ;; $block_2
          local.get $1
          local.get $5
          call $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf
          local.get $1
          i32.load offset=16
          i32.add
          i32.store offset=16
          local.get $4
          local.get $4
          i32.load
          i32.const 2
          i32.shl
          i32.add
          i32.const 8
          i32.add
          local.get $5
          i32.store
          local.get $4
          local.get $4
          i32.load
          i32.const 1
          i32.add
          i32.store
        end ;; $block_1
        local.get $1
        local.get $1
        i32.load offset=12
        i32.const 1
        i32.add
        i32.store offset=12
      end ;; $block_0
      block $block_3
        local.get $1
        i32.load
        local.tee $7
        i32.eqz
        br_if $block_3
        local.get $1
        i32.load offset=4
        local.set $6
        loop $loop
          local.get $7
          i32.eqz
          br_if $block_3
          local.get $7
          i32.load
          i32.const 2
          i32.shl
          local.get $7
          i32.const 8
          i32.add
          local.tee $1
          i32.add
          local.set $5
          block $block_4
            loop $loop_0
              local.get $1
              local.get $5
              i32.ge_u
              br_if $block_4
              local.get $1
              i32.load
              local.tee $4
              i32.eqz
              br_if $block_4
              local.get $6
              local.get $4
              call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
              local.get $1
              i32.const 4
              i32.add
              local.set $1
              br $loop_0
            end ;; $loop_0
          end ;; $block_4
          block $block_5
            local.get $7
            i32.load offset=4
            br_if $block_5
            local.get $6
            local.get $7
            i32.const -20
            i32.add
            call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
            br $block_3
          end ;; $block_5
          local.get $6
          local.get $7
          call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
          local.get $7
          i32.load offset=4
          local.set $7
          br $loop
        end ;; $loop
      end ;; $block_3
      block $block_6
        i32.const 0
        i32.load offset=66712
        br_if $block_6
        i32.const 128
        call $runtime.alloc
        local.tee $1
        i32.const 10
        i32.store8
        i32.const 0
        local.get $1
        i32.store offset=66712
      end ;; $block_6
      local.get $2
      i32.const 64
      i32.add
      call $time.Now
      local.get $2
      i64.load offset=64
      local.tee $8
      i64.const 1073741823
      i64.and
      local.get $2
      i64.load offset=72
      local.get $8
      i64.const 30
      i64.shr_u
      i64.const 8589934591
      i64.and
      i64.const 59453308800
      i64.add
      local.get $8
      i64.const -1
      i64.gt_s
      select
      i64.const 1000000000
      i64.mul
      i64.add
      i64.const -6795364578871345152
      i64.add
      call $runtime.printint64
      call $runtime.printnl
      i32.const 0
      i32.load offset=66704
      local.set $4
      local.get $2
      i32.const 48
      i32.add
      call $time.Now
      local.get $4
      i32.eqz
      br_if $block
      local.get $2
      i64.load offset=48
      local.tee $8
      i64.const 30
      i64.shr_u
      i64.const 8589934591
      i64.and
      local.set $9
      local.get $2
      i64.load offset=56
      local.set $10
      local.get $4
      i32.const 72
      i32.add
      local.tee $1
      local.get $1
      i64.load
      i64.const 1
      i64.add
      i64.store
      block $block_7
        block $block_8
          block $block_9
            local.get $4
            i32.const 56
            i32.add
            i32.load
            br_table
              $block_7 $block_9 $block_8
              $block_9 ;; default
          end ;; $block_9
          call $github.com/moontrade/memory/alloc.doMarkGlobals
          br $block_7
        end ;; $block_8
        call $github.com/moontrade/memory/alloc.doMarkStack
      end ;; $block_7
      local.get $8
      i64.const -1
      i64.gt_s
      local.set $1
      local.get $9
      i64.const 59453308800
      i64.add
      local.set $9
      block $block_10
        block $block_11
          block $block_12
            local.get $4
            i32.const 48
            i32.add
            i32.load
            br_table
              $block_10 $block_11 $block_12
              $block_11 ;; default
          end ;; $block_12
          call $github.com/moontrade/memory/alloc.doMarkStack
          br $block_10
        end ;; $block_11
        call $github.com/moontrade/memory/alloc.doMarkGlobals
      end ;; $block_10
      local.get $10
      local.get $9
      local.get $1
      select
      local.set $10
      local.get $8
      i64.const 1073741823
      i64.and
      local.set $11
      local.get $2
      i32.const 32
      i32.add
      call $time.Now
      local.get $2
      i64.load offset=40
      local.set $9
      local.get $2
      i64.load offset=32
      local.set $8
      local.get $4
      i32.const 344
      i32.add
      i64.const 0
      i64.store
      local.get $4
      i32.const 336
      i32.add
      i64.const 0
      i64.store
      local.get $4
      i32.load offset=8
      i32.const 3
      i32.shl
      local.get $4
      i32.load
      local.tee $7
      i32.add
      local.set $12
      local.get $8
      i64.const 30
      i64.shr_u
      i64.const 8589934591
      i64.and
      i64.const 59453308800
      i64.add
      local.set $13
      loop $loop_1
        block $block_13
          block $block_14
            local.get $7
            local.get $12
            i32.ge_u
            br_if $block_14
            local.get $7
            i32.load
            local.tee $1
            i32.eqz
            br_if $block_13
            local.get $1
            i32.load offset=8
            local.tee $5
            i32.const 3
            i32.and
            br_if $block_13
            local.get $5
            local.get $1
            i32.const 20
            i32.add
            local.tee $1
            i32.add
            local.set $6
            loop $loop_2
              local.get $1
              local.get $6
              i32.ge_u
              br_if $block_13
              block $block_15
                local.get $1
                i32.load
                i32.const -20
                i32.add
                local.tee $5
                local.get $4
                i32.load offset=32
                i32.lt_u
                br_if $block_15
                local.get $5
                local.get $4
                i32.load offset=36
                i32.gt_u
                br_if $block_15
                local.get $4
                local.get $5
                call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Has
                i32.const 1
                i32.and
                i32.eqz
                br_if $block_15
                local.get $4
                local.get $5
                i32.const 0
                call $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRecursive
              end ;; $block_15
              local.get $1
              i32.const 4
              i32.add
              local.set $1
              br $loop_2
            end ;; $loop_2
          end ;; $block_14
          local.get $9
          local.get $13
          local.get $8
          i64.const -1
          i64.gt_s
          select
          local.set $13
          local.get $8
          i64.const 1073741823
          i64.and
          local.set $14
          local.get $2
          i32.const 16
          i32.add
          call $time.Now
          local.get $4
          i32.load offset=8
          i32.const 3
          i32.shl
          local.get $4
          i32.load
          local.tee $5
          i32.add
          local.set $12
          i32.const -1
          local.set $6
          local.get $2
          i64.load offset=24
          local.set $15
          local.get $2
          i64.load offset=16
          local.set $9
          i32.const 0
          local.set $7
          loop $loop_3
            block $block_16
              block $block_17
                local.get $5
                local.get $12
                i32.ge_u
                br_if $block_17
                local.get $5
                i32.load
                local.tee $1
                i32.eqz
                br_if $block_16
                block $block_18
                  local.get $1
                  i32.load offset=4
                  i32.eqz
                  br_if $block_18
                  local.get $1
                  i32.const 0
                  i32.store offset=4
                  local.get $1
                  local.get $7
                  local.get $1
                  local.get $7
                  i32.gt_u
                  select
                  local.set $7
                  local.get $1
                  local.get $6
                  local.get $1
                  local.get $6
                  i32.lt_u
                  select
                  local.set $6
                  br $block_16
                end ;; $block_18
                local.get $4
                local.get $4
                i32.load offset=352
                local.get $1
                i32.load
                i32.const 4
                i32.add
                i32.const -4
                i32.and
                i32.sub
                i32.store offset=352
                local.get $1
                i32.load
                local.set $16
                local.get $4
                local.get $4
                i64.load offset=80
                i64.const -1
                i64.add
                i64.store offset=80
                local.get $4
                local.get $4
                i64.load offset=336
                i64.const 1
                i64.add
                i64.store offset=336
                local.get $4
                local.get $4
                i64.load offset=344
                local.get $16
                i32.const 4
                i32.add
                i32.const -4
                i32.and
                i64.extend_i32_u
                i64.add
                i64.store offset=344
                local.get $1
                i64.load32_u offset=8
                local.set $8
                local.get $1
                i32.load
                local.set $16
                i32.const 66032
                i32.const 8
                call $runtime.printstring
                i32.const 32
                call $runtime.putchar
                local.get $1
                i32.const 20
                i32.add
                i64.extend_i32_u
                call $runtime.printuint64
                i32.const 32
                call $runtime.putchar
                i32.const 66040
                i32.const 4
                call $runtime.printstring
                i32.const 32
                call $runtime.putchar
                local.get $16
                i32.const 4
                i32.add
                i32.const -4
                i32.and
                i64.extend_i32_u
                call $runtime.printuint64
                i32.const 32
                call $runtime.putchar
                i32.const 66044
                i32.const 6
                call $runtime.printstring
                i32.const 32
                call $runtime.putchar
                local.get $8
                call $runtime.printuint64
                call $runtime.printnl
                local.get $4
                i32.load offset=40
                local.get $1
                i32.const 4
                i32.add
                call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
                local.get $4
                local.get $1
                call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Delete
                drop
                br $block_16
              end ;; $block_17
              local.get $4
              local.get $7
              i32.store offset=36
              local.get $4
              local.get $6
              i32.store offset=32
              local.get $2
              call $time.Now
              local.get $2
              i64.load offset=8
              local.set $17
              local.get $2
              i64.load
              local.set $8
              local.get $4
              i32.const 304
              i32.add
              local.get $14
              local.get $13
              i64.const 1000000000
              i64.mul
              i64.add
              i64.const -6795364578871345152
              i64.add
              local.tee $13
              local.get $10
              i64.const -1000000000
              i64.mul
              local.get $11
              i64.sub
              i64.const 6795364578871345152
              i64.add
              local.tee $10
              i64.add
              i64.store
              local.get $4
              i32.const 128
              i32.add
              local.tee $1
              local.get $1
              i64.load
              local.get $4
              i64.load offset=344
              i64.add
              i64.store
              local.get $4
              i32.const 120
              i32.add
              local.tee $1
              local.get $1
              i64.load
              local.get $4
              i64.load offset=336
              i64.add
              i64.store
              local.get $4
              i32.const 312
              i32.add
              local.get $9
              i64.const 1073741823
              i64.and
              local.get $15
              local.get $9
              i64.const 30
              i64.shr_u
              i64.const 8589934591
              i64.and
              i64.const 59453308800
              i64.add
              local.get $9
              i64.const -1
              i64.gt_s
              select
              i64.const 1000000000
              i64.mul
              i64.add
              i64.const -6795364578871345152
              i64.add
              local.tee $9
              local.get $13
              i64.sub
              i64.store
              local.get $4
              i32.const 320
              i32.add
              local.get $8
              i64.const 1073741823
              i64.and
              local.get $9
              i64.sub
              local.get $17
              local.get $8
              i64.const 30
              i64.shr_u
              i64.const 8589934591
              i64.and
              i64.const 59453308800
              i64.add
              local.get $8
              i64.const -1
              i64.gt_s
              select
              i64.const 1000000000
              i64.mul
              i64.add
              i64.const -6795364578871345152
              i64.add
              local.tee $8
              i64.store
              local.get $4
              i32.const 136
              i32.add
              local.tee $1
              local.get $8
              local.get $1
              i64.load
              i64.add
              i64.store
              local.get $4
              i32.const 328
              i32.add
              local.get $9
              local.get $10
              i64.add
              local.get $8
              i64.add
              local.tee $8
              i64.store
              local.get $4
              i32.const 272
              i32.add
              local.tee $1
              local.get $1
              i64.load
              local.get $8
              i64.add
              i64.store
              i32.const 0
              i32.load offset=66704
              local.tee $1
              i32.eqz
              br_if $block
              local.get $3
              i32.load offset=8
              local.set $4
              i32.const 66084
              i32.const 8
              call $runtime.printstring
              call $runtime.printnl
              local.get $1
              i32.const 80
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66092
              i32.const 10
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 352
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66102
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 104
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66117
              i32.const 11
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 88
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66128
              i32.const 12
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 112
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66140
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 128
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66155
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 96
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66170
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 336
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66185
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 344
              i32.add
              i64.load32_u
              local.set $8
              i32.const 66200
              i32.const 19
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              call $runtime.printuint64
              call $runtime.printnl
              local.get $1
              i32.const 304
              i32.add
              i64.load
              local.set $8
              i32.const 66219
              i32.const 18
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              i64.const 1000
              i64.div_s
              call $runtime.printint64
              i32.const 32
              call $runtime.putchar
              i32.const 66289
              i32.const 3
              call $runtime.printstring
              call $runtime.printnl
              local.get $1
              i32.const 312
              i32.add
              i64.load
              local.set $8
              i32.const 66237
              i32.const 18
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              i64.const 1000
              i64.div_s
              call $runtime.printint64
              i32.const 32
              call $runtime.putchar
              i32.const 66289
              i32.const 3
              call $runtime.printstring
              call $runtime.printnl
              local.get $1
              i32.const 320
              i32.add
              i64.load
              local.set $8
              i32.const 66255
              i32.const 18
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              i64.const 1000
              i64.div_s
              call $runtime.printint64
              i32.const 32
              call $runtime.putchar
              i32.const 66289
              i32.const 3
              call $runtime.printstring
              call $runtime.printnl
              local.get $1
              i32.const 328
              i32.add
              i64.load
              local.set $8
              i32.const 66273
              i32.const 16
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $8
              i64.const 1000
              i64.div_s
              call $runtime.printint64
              i32.const 32
              call $runtime.putchar
              i32.const 66289
              i32.const 3
              call $runtime.printstring
              call $runtime.printnl
              local.get $4
              i32.eqz
              br_if $block
              local.get $3
              i32.load offset=8
              i64.const 1000000000
              i64.store offset=8
              call $runtime.ticks
              local.set $8
              block $block_19
                i32.const 0
                i32.load offset=66672
                local.tee $4
                br_if $block_19
                i32.const 0
                local.get $8
                i64.store offset=66688
              end ;; $block_19
              i32.const 66672
              local.set $1
              block $block_20
                loop $loop_4
                  local.get $4
                  i32.eqz
                  br_if $block_20
                  block $block_21
                    local.get $3
                    i32.load offset=8
                    local.tee $5
                    i64.load offset=8
                    local.tee $8
                    local.get $4
                    i64.load offset=8
                    local.tee $9
                    i64.lt_u
                    br_if $block_21
                    local.get $5
                    local.get $8
                    local.get $9
                    i64.sub
                    i64.store offset=8
                    local.get $1
                    i32.load
                    local.tee $1
                    i32.eqz
                    br_if $block
                    local.get $1
                    i32.load
                    local.set $4
                    br $loop_4
                  end ;; $block_21
                end ;; $loop_4
                local.get $4
                local.get $9
                local.get $8
                i64.sub
                i64.store offset=8
              end ;; $block_20
              local.get $3
              i32.load offset=8
              local.tee $4
              local.get $1
              i32.load
              i32.store
              local.get $1
              local.get $4
              i32.store
              local.get $3
              i32.const 0
              i32.store8 offset=12
              local.get $2
              i32.const 80
              i32.add
              global.set $15
              return
            end ;; $block_16
            local.get $5
            i32.const 8
            i32.add
            local.set $5
            br $loop_3
          end ;; $loop_3
        end ;; $block_13
        local.get $7
        i32.const 8
        i32.add
        local.set $7
        br $loop_1
      end ;; $loop_1
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $main.main$1.destroy (type $0)
    (param $0 i32)
    local.get $0
    call $runtime.free
    )
  
  (func $main.main$1.resume (type $0)
    (param $0 i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i64)
    (local $8 i64)
    (local $9 i64)
    (local $10 i64)
    (local $11 i32)
    (local $12 i64)
    (local $13 i64)
    (local $14 i64)
    (local $15 i32)
    (local $16 i64)
    global.get $15
    i32.const 80
    i32.sub
    local.tee $1
    global.set $15
    block $block
      i32.const 66719
      i32.const -4
      i32.and
      i32.const 0
      i32.const 0
      i32.load8_u offset=66700
      select
      local.tee $2
      i32.const 156
      call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc
      local.tee $3
      i32.eqz
      br_if $block
      local.get $3
      i64.const 32
      i64.store offset=8 align=4
      local.get $3
      local.get $2
      i32.store offset=4
      local.get $3
      local.get $3
      i32.const 20
      i32.add
      i32.store
      local.get $3
      local.get $3
      call $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf
      i32.store offset=16
      local.get $3
      i32.load
      local.tee $2
      i32.eqz
      br_if $block
      local.get $2
      i64.const 0
      i64.store align=4
      local.get $3
      i32.load offset=4
      i32.const 512
      call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc
      local.set $4
      block $block_0
        local.get $3
        i32.load
        local.tee $2
        i32.eqz
        br_if $block_0
        block $block_1
          block $block_2
            local.get $2
            i32.load
            local.tee $5
            local.get $3
            i32.load offset=8
            i32.ne
            br_if $block_2
            local.get $3
            local.get $3
            i32.load offset=4
            local.get $5
            i32.const 2
            i32.shl
            i32.const 8
            i32.add
            call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Alloc
            local.tee $5
            call $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf
            local.get $4
            call $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf
            i32.add
            local.get $3
            i32.load offset=16
            i32.add
            i32.store offset=16
            local.get $5
            i32.eqz
            br_if $block
            local.get $5
            local.get $2
            i32.store offset=4
            local.get $5
            i32.const 1
            i32.store
            local.get $3
            local.get $5
            i32.store
            local.get $5
            local.get $4
            i32.store offset=8
            br $block_1
          end ;; $block_2
          local.get $3
          local.get $4
          call $_lparen_github.com/moontrade/memory/alloc.Allocator_rparen_.SizeOf
          local.get $3
          i32.load offset=16
          i32.add
          i32.store offset=16
          local.get $2
          local.get $2
          i32.load
          i32.const 2
          i32.shl
          i32.add
          i32.const 8
          i32.add
          local.get $4
          i32.store
          local.get $2
          local.get $2
          i32.load
          i32.const 1
          i32.add
          i32.store
        end ;; $block_1
        local.get $3
        local.get $3
        i32.load offset=12
        i32.const 1
        i32.add
        i32.store offset=12
      end ;; $block_0
      block $block_3
        local.get $3
        i32.load
        local.tee $6
        i32.eqz
        br_if $block_3
        local.get $3
        i32.load offset=4
        local.set $5
        loop $loop
          local.get $6
          i32.eqz
          br_if $block_3
          local.get $6
          i32.load
          i32.const 2
          i32.shl
          local.get $6
          i32.const 8
          i32.add
          local.tee $3
          i32.add
          local.set $4
          block $block_4
            loop $loop_0
              local.get $3
              local.get $4
              i32.ge_u
              br_if $block_4
              local.get $3
              i32.load
              local.tee $2
              i32.eqz
              br_if $block_4
              local.get $5
              local.get $2
              call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
              local.get $3
              i32.const 4
              i32.add
              local.set $3
              br $loop_0
            end ;; $loop_0
          end ;; $block_4
          block $block_5
            local.get $6
            i32.load offset=4
            br_if $block_5
            local.get $5
            local.get $6
            i32.const -20
            i32.add
            call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
            br $block_3
          end ;; $block_5
          local.get $5
          local.get $6
          call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
          local.get $6
          i32.load offset=4
          local.set $6
          br $loop
        end ;; $loop
      end ;; $block_3
      block $block_6
        i32.const 0
        i32.load offset=66712
        br_if $block_6
        i32.const 128
        call $runtime.alloc
        local.tee $3
        i32.const 10
        i32.store8
        i32.const 0
        local.get $3
        i32.store offset=66712
      end ;; $block_6
      local.get $1
      i32.const 64
      i32.add
      call $time.Now
      local.get $1
      i64.load offset=64
      local.tee $7
      i64.const 1073741823
      i64.and
      local.get $1
      i64.load offset=72
      local.get $7
      i64.const 30
      i64.shr_u
      i64.const 8589934591
      i64.and
      i64.const 59453308800
      i64.add
      local.get $7
      i64.const -1
      i64.gt_s
      select
      i64.const 1000000000
      i64.mul
      i64.add
      i64.const -6795364578871345152
      i64.add
      call $runtime.printint64
      call $runtime.printnl
      i32.const 0
      i32.load offset=66704
      local.set $2
      local.get $1
      i32.const 48
      i32.add
      call $time.Now
      local.get $2
      i32.eqz
      br_if $block
      local.get $1
      i64.load offset=48
      local.tee $7
      i64.const 30
      i64.shr_u
      i64.const 8589934591
      i64.and
      local.set $8
      local.get $1
      i64.load offset=56
      local.set $9
      local.get $2
      i32.const 72
      i32.add
      local.tee $3
      local.get $3
      i64.load
      i64.const 1
      i64.add
      i64.store
      block $block_7
        block $block_8
          block $block_9
            local.get $2
            i32.const 56
            i32.add
            i32.load
            br_table
              $block_7 $block_9 $block_8
              $block_9 ;; default
          end ;; $block_9
          call $github.com/moontrade/memory/alloc.doMarkGlobals
          br $block_7
        end ;; $block_8
        call $github.com/moontrade/memory/alloc.doMarkStack
      end ;; $block_7
      local.get $7
      i64.const -1
      i64.gt_s
      local.set $3
      local.get $8
      i64.const 59453308800
      i64.add
      local.set $8
      block $block_10
        block $block_11
          block $block_12
            local.get $2
            i32.const 48
            i32.add
            i32.load
            br_table
              $block_10 $block_11 $block_12
              $block_11 ;; default
          end ;; $block_12
          call $github.com/moontrade/memory/alloc.doMarkStack
          br $block_10
        end ;; $block_11
        call $github.com/moontrade/memory/alloc.doMarkGlobals
      end ;; $block_10
      local.get $9
      local.get $8
      local.get $3
      select
      local.set $9
      local.get $7
      i64.const 1073741823
      i64.and
      local.set $10
      local.get $1
      i32.const 32
      i32.add
      call $time.Now
      local.get $1
      i64.load offset=40
      local.set $8
      local.get $1
      i64.load offset=32
      local.set $7
      local.get $2
      i32.const 344
      i32.add
      i64.const 0
      i64.store
      local.get $2
      i32.const 336
      i32.add
      i64.const 0
      i64.store
      local.get $2
      i32.load offset=8
      i32.const 3
      i32.shl
      local.get $2
      i32.load
      local.tee $6
      i32.add
      local.set $11
      local.get $7
      i64.const 30
      i64.shr_u
      i64.const 8589934591
      i64.and
      i64.const 59453308800
      i64.add
      local.set $12
      loop $loop_1
        block $block_13
          block $block_14
            local.get $6
            local.get $11
            i32.ge_u
            br_if $block_14
            local.get $6
            i32.load
            local.tee $3
            i32.eqz
            br_if $block_13
            local.get $3
            i32.load offset=8
            local.tee $4
            i32.const 3
            i32.and
            br_if $block_13
            local.get $4
            local.get $3
            i32.const 20
            i32.add
            local.tee $3
            i32.add
            local.set $5
            loop $loop_2
              local.get $3
              local.get $5
              i32.ge_u
              br_if $block_13
              block $block_15
                local.get $3
                i32.load
                i32.const -20
                i32.add
                local.tee $4
                local.get $2
                i32.load offset=32
                i32.lt_u
                br_if $block_15
                local.get $4
                local.get $2
                i32.load offset=36
                i32.gt_u
                br_if $block_15
                local.get $2
                local.get $4
                call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Has
                i32.const 1
                i32.and
                i32.eqz
                br_if $block_15
                local.get $2
                local.get $4
                i32.const 0
                call $_lparen_*github.com/moontrade/memory/alloc.gc_rparen_.markRecursive
              end ;; $block_15
              local.get $3
              i32.const 4
              i32.add
              local.set $3
              br $loop_2
            end ;; $loop_2
          end ;; $block_14
          local.get $8
          local.get $12
          local.get $7
          i64.const -1
          i64.gt_s
          select
          local.set $12
          local.get $7
          i64.const 1073741823
          i64.and
          local.set $13
          local.get $1
          i32.const 16
          i32.add
          call $time.Now
          local.get $2
          i32.load offset=8
          i32.const 3
          i32.shl
          local.get $2
          i32.load
          local.tee $4
          i32.add
          local.set $11
          i32.const -1
          local.set $5
          local.get $1
          i64.load offset=24
          local.set $14
          local.get $1
          i64.load offset=16
          local.set $8
          i32.const 0
          local.set $6
          loop $loop_3
            block $block_16
              block $block_17
                local.get $4
                local.get $11
                i32.ge_u
                br_if $block_17
                local.get $4
                i32.load
                local.tee $3
                i32.eqz
                br_if $block_16
                block $block_18
                  local.get $3
                  i32.load offset=4
                  i32.eqz
                  br_if $block_18
                  local.get $3
                  i32.const 0
                  i32.store offset=4
                  local.get $3
                  local.get $6
                  local.get $3
                  local.get $6
                  i32.gt_u
                  select
                  local.set $6
                  local.get $3
                  local.get $5
                  local.get $3
                  local.get $5
                  i32.lt_u
                  select
                  local.set $5
                  br $block_16
                end ;; $block_18
                local.get $2
                local.get $2
                i32.load offset=352
                local.get $3
                i32.load
                i32.const 4
                i32.add
                i32.const -4
                i32.and
                i32.sub
                i32.store offset=352
                local.get $3
                i32.load
                local.set $15
                local.get $2
                local.get $2
                i64.load offset=80
                i64.const -1
                i64.add
                i64.store offset=80
                local.get $2
                local.get $2
                i64.load offset=336
                i64.const 1
                i64.add
                i64.store offset=336
                local.get $2
                local.get $2
                i64.load offset=344
                local.get $15
                i32.const 4
                i32.add
                i32.const -4
                i32.and
                i64.extend_i32_u
                i64.add
                i64.store offset=344
                local.get $3
                i64.load32_u offset=8
                local.set $7
                local.get $3
                i32.load
                local.set $15
                i32.const 66032
                i32.const 8
                call $runtime.printstring
                i32.const 32
                call $runtime.putchar
                local.get $3
                i32.const 20
                i32.add
                i64.extend_i32_u
                call $runtime.printuint64
                i32.const 32
                call $runtime.putchar
                i32.const 66040
                i32.const 4
                call $runtime.printstring
                i32.const 32
                call $runtime.putchar
                local.get $15
                i32.const 4
                i32.add
                i32.const -4
                i32.and
                i64.extend_i32_u
                call $runtime.printuint64
                i32.const 32
                call $runtime.putchar
                i32.const 66044
                i32.const 6
                call $runtime.printstring
                i32.const 32
                call $runtime.putchar
                local.get $7
                call $runtime.printuint64
                call $runtime.printnl
                local.get $2
                i32.load offset=40
                local.get $3
                i32.const 4
                i32.add
                call $_lparen_*github.com/moontrade/memory/tlsf.Heap_rparen_.Free
                local.get $2
                local.get $3
                call $_lparen_*github.com/moontrade/memory/alloc.PointerSet_rparen_.Delete
                drop
                br $block_16
              end ;; $block_17
              local.get $2
              local.get $6
              i32.store offset=36
              local.get $2
              local.get $5
              i32.store offset=32
              local.get $1
              call $time.Now
              local.get $1
              i64.load offset=8
              local.set $16
              local.get $1
              i64.load
              local.set $7
              local.get $2
              i32.const 304
              i32.add
              local.get $13
              local.get $12
              i64.const 1000000000
              i64.mul
              i64.add
              i64.const -6795364578871345152
              i64.add
              local.tee $12
              local.get $9
              i64.const -1000000000
              i64.mul
              local.get $10
              i64.sub
              i64.const 6795364578871345152
              i64.add
              local.tee $9
              i64.add
              i64.store
              local.get $2
              i32.const 128
              i32.add
              local.tee $3
              local.get $3
              i64.load
              local.get $2
              i64.load offset=344
              i64.add
              i64.store
              local.get $2
              i32.const 120
              i32.add
              local.tee $3
              local.get $3
              i64.load
              local.get $2
              i64.load offset=336
              i64.add
              i64.store
              local.get $2
              i32.const 312
              i32.add
              local.get $8
              i64.const 1073741823
              i64.and
              local.get $14
              local.get $8
              i64.const 30
              i64.shr_u
              i64.const 8589934591
              i64.and
              i64.const 59453308800
              i64.add
              local.get $8
              i64.const -1
              i64.gt_s
              select
              i64.const 1000000000
              i64.mul
              i64.add
              i64.const -6795364578871345152
              i64.add
              local.tee $8
              local.get $12
              i64.sub
              i64.store
              local.get $2
              i32.const 320
              i32.add
              local.get $7
              i64.const 1073741823
              i64.and
              local.get $8
              i64.sub
              local.get $16
              local.get $7
              i64.const 30
              i64.shr_u
              i64.const 8589934591
              i64.and
              i64.const 59453308800
              i64.add
              local.get $7
              i64.const -1
              i64.gt_s
              select
              i64.const 1000000000
              i64.mul
              i64.add
              i64.const -6795364578871345152
              i64.add
              local.tee $7
              i64.store
              local.get $2
              i32.const 136
              i32.add
              local.tee $3
              local.get $7
              local.get $3
              i64.load
              i64.add
              i64.store
              local.get $2
              i32.const 328
              i32.add
              local.get $8
              local.get $9
              i64.add
              local.get $7
              i64.add
              local.tee $7
              i64.store
              local.get $2
              i32.const 272
              i32.add
              local.tee $3
              local.get $3
              i64.load
              local.get $7
              i64.add
              i64.store
              i32.const 0
              i32.load offset=66704
              local.tee $3
              i32.eqz
              br_if $block
              local.get $0
              i32.load offset=8
              local.set $2
              i32.const 66084
              i32.const 8
              call $runtime.printstring
              call $runtime.printnl
              local.get $3
              i32.const 80
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66092
              i32.const 10
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 352
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66102
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 104
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66117
              i32.const 11
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 88
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66128
              i32.const 12
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 112
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66140
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 128
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66155
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 96
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66170
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 336
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66185
              i32.const 15
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 344
              i32.add
              i64.load32_u
              local.set $7
              i32.const 66200
              i32.const 19
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              call $runtime.printuint64
              call $runtime.printnl
              local.get $3
              i32.const 304
              i32.add
              i64.load
              local.set $7
              i32.const 66219
              i32.const 18
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              i64.const 1000
              i64.div_s
              call $runtime.printint64
              i32.const 32
              call $runtime.putchar
              i32.const 66289
              i32.const 3
              call $runtime.printstring
              call $runtime.printnl
              local.get $3
              i32.const 312
              i32.add
              i64.load
              local.set $7
              i32.const 66237
              i32.const 18
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              i64.const 1000
              i64.div_s
              call $runtime.printint64
              i32.const 32
              call $runtime.putchar
              i32.const 66289
              i32.const 3
              call $runtime.printstring
              call $runtime.printnl
              local.get $3
              i32.const 320
              i32.add
              i64.load
              local.set $7
              i32.const 66255
              i32.const 18
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              i64.const 1000
              i64.div_s
              call $runtime.printint64
              i32.const 32
              call $runtime.putchar
              i32.const 66289
              i32.const 3
              call $runtime.printstring
              call $runtime.printnl
              local.get $3
              i32.const 328
              i32.add
              i64.load
              local.set $7
              i32.const 66273
              i32.const 16
              call $runtime.printstring
              i32.const 32
              call $runtime.putchar
              local.get $7
              i64.const 1000
              i64.div_s
              call $runtime.printint64
              i32.const 32
              call $runtime.putchar
              i32.const 66289
              i32.const 3
              call $runtime.printstring
              call $runtime.printnl
              local.get $2
              i32.eqz
              br_if $block
              local.get $2
              i64.const 1000000000
              i64.store offset=8
              call $runtime.ticks
              local.set $7
              block $block_19
                i32.const 0
                i32.load offset=66672
                local.tee $2
                br_if $block_19
                i32.const 0
                local.get $7
                i64.store offset=66688
              end ;; $block_19
              local.get $0
              i32.load offset=8
              local.set $4
              i32.const 66672
              local.set $3
              block $block_20
                loop $loop_4
                  local.get $2
                  i32.eqz
                  br_if $block_20
                  block $block_21
                    local.get $4
                    i64.load offset=8
                    local.tee $7
                    local.get $2
                    i64.load offset=8
                    local.tee $8
                    i64.lt_u
                    br_if $block_21
                    local.get $4
                    local.get $7
                    local.get $8
                    i64.sub
                    i64.store offset=8
                    local.get $3
                    i32.load
                    local.tee $3
                    i32.eqz
                    br_if $block
                    local.get $3
                    i32.load
                    local.set $2
                    br $loop_4
                  end ;; $block_21
                end ;; $loop_4
                local.get $2
                local.get $8
                local.get $7
                i64.sub
                i64.store offset=8
              end ;; $block_20
              local.get $4
              local.get $3
              i32.load
              i32.store
              local.get $0
              i32.const 0
              i32.store8 offset=12
              local.get $3
              local.get $4
              i32.store
              local.get $1
              i32.const 80
              i32.add
              global.set $15
              return
            end ;; $block_16
            local.get $4
            i32.const 8
            i32.add
            local.set $4
            br $loop_3
          end ;; $loop_3
        end ;; $block_13
        local.get $6
        i32.const 8
        i32.add
        local.set $6
        br $loop_1
      end ;; $loop_1
    end ;; $block
    call $runtime.nilPanic
    unreachable
    )
  
  (func $.LNoopCoro.ResumeDestroy (type $0)
    (param $0 i32)
    )
  
  (data $17 (i32.const 65536)
    "\00\01\1c\02\1d\0e\18\03\1e\16\14\0f\19\11\04\08\1f\1b\0d\17\15\13\10\07\1a\0c\12\06\0b\05\n\09\00\01\02\02\03\03\03\03\04\04\04\04\04\04\04\04\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05"
    "\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07"
    "\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08"
    "\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08"
    "\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08(\01\01\00\03\00\00\00nil\00\00\00\00\008\01\01\002\00\00\00used blo"
    "ck is not valid to be freed or reallocated/proc/self/exenil poin"
    "ter dereferencepanic: runtime error: index out of rangeslice out"
    " of rangeinvalid channel stateunreachablepanic: GC sweepsizertSi"
    "ze\00\00\00\00\00\00\10\02\01\00\14\00\00\00allocation too largeGC cycle\09live:\09\09\09\09\09live byte"
    "s:\09\09\09\09frees:\09\09\09\09\09allocs:\09\09\09\09\09freed bytes:\09\09\09sweep bytes:\09\09\09total"
    " bytes:\09\09\09last sweep:\09\09\09\09last sweep bytes:\09\09last mark time:\09\09\09la"
    "st graph time:\09\09last sweep time:\09\09last GC time:\09\09\c2\b5sgcInitHeapgc"
    "Freehi moontrade!\00\00\00\00\00\00\00\09\00\00\00\09\00\00\00")
  
  (data $18 (i32.const 66336)
    ",\03\01\00\01\00\00\00\01\00\00\00j\01\01\00\0e\00\00\00h\03\01\00\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\94\04\01\00")
  
  ;;(custom_section "producers"
  ;;  (after data)
  ;;  "\01\0cprocessed-by\01\05clang\\11.0.0 (ht"
  ;;  "tps://github.com/tinygo-org/llvm"
  ;;  "-project 9ecb19f774994a3efff5a6b"
  ;;  "89aa43ba2b8d2dd23)")
  
  )