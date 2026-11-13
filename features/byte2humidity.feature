Feature: Humidity data parser

	Scenario Outline: Converts the byte to integer
		Given the WASM module is instantiated
		When I call the exported function "byte2humidity" with "<arg1>"
		Then the result should be <expected>

		Examples:
			| arg1 | expected |
			| 0x00 |   0      |
			| 0x0a |  10      |
			| 0x10 |  16      |
			| 0x20 |  32      |
			| 0x30 |  48      |
			| 0x64 | 100      |
