(module

  (func $max (export "max32i") (param $x i32) (param $y i32) (result i32)
    ;; x <= y ? y : x
    local.get $y local.get $x
    local.get $x local.get $y
    i32.le_s
    select
  )

  (func $min (export "min32i") (param $x i32) (param $y i32) (result i32)
    ;; x <= y ? x : y
    local.get $x local.get $y
    local.get $x local.get $y
    i32.le_s
    select
  )

  (func $clamp (export "clamp32i")
    (param $lo i32) (param $i i32) (param $hi i32)
    (result i32)

    ;; min(hi, i)
    local.get $hi local.get $i call $min

    ;; max(lo, min(hi,i))
    local.get $lo call $max
  )

	(func $byte2humidity (export "byte2humidity") (param $b i32) (result i32)
		;; converts the byte to humidity value
		;; e.g.,
		;; input: 0x23
		;; output: 35 [%]

    i32.const 0
    local.get $b
    i32.const 100
    call $clamp
	)

)
