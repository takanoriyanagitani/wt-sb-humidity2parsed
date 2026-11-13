import { Given, Then, When } from "@cucumber/cucumber";

import assert from "node:assert/strict";

import { readFile } from "node:fs/promises";

Given("the WASM module is instantiated", function () {
  const pwasmBytes = readFile("./parser.wasm");
  const pwasm = pwasmBytes.then(WebAssembly.instantiate);
  const pset = pwasm.then((i) => {
    this.instance = i.instance;
    return;
  });
  return pset;
});

When(
  "I call the exported function {string} with {string}",
  function (funcName, arg1) {
    const parg1 = Number.parseInt(arg1, 16);
    this.result = this.instance.exports[funcName](parg1);
  },
);

Then(
  "the result should be {int}",
  function (expected) {
    assert.equal(this.result, expected);
  },
);
