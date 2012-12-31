dscript-library
===============

D-Script script examples powered by MiniKonoha <https://github.com/konoha-project/minikonoha>

Templtate
---------

	// written by your name
	
	import("dshell");
	import("konoha.json");
	
	const DCaseContext = Json;
	
	boolean DoRecover(DCaseContext context) {
		boolean result = false;
		/* ... */
		return result;
	}
	
	void main() {
		DCaseContext ctx = new DCaseContext();
		DoRecover(ctx);
	}
	
	main();

Rules
-----

### 1. Method interface

* Method name should be CamelCase.
* Set filename same as method name.
* Return true if succeeded.
* Get parameter from context.
