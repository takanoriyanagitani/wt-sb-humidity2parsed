Feature: Humidity data parser

	Scenario Outline: Computes the max of the integers
		Given the WASM module is instantiated for max
		When I call the exported function "max32i" with "<arg1>" and "<arg2>"
		Then the max should be <expected>

		Examples:
			| arg1 | arg2 | expected |
			|    0 |    0 |   0      |
			|    1 |    1 |   1      |
			|    2 |   -2 |   2      |
			|    3 |    4 |   4      |
			|    5 |   -8 |   5      |
			|    7 |   16 |  16      |
