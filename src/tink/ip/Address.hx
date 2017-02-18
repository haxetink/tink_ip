package tink.ip;

import haxe.io.Bytes; // TODO: use tink_chunk

using tink.CoreApi;

abstract Address(Base) to Base {
	
	static var INVALID_FORMAT = new Error('Invalid IP format');
	
	function new(version, bytes)
		this = new Base(version, bytes);
		
	public static function parse(v:String) {
		return
			if(isValidV4(v))
				parseV4(v);
			else
				// TODO: ipv6
				Failure(INVALID_FORMAT);
	}
	
	public static function isValidV4(v:String) {
		 // TODO: more intellgent check
		return v.split('.').length == 4;
	}
	
	
	static function parseV4(v:String) {
		var parts = v.split('.');
		
		var bytes = Bytes.alloc(4);
		for(i in 0...4) switch Std.parseInt(parts[i]) {
			case null: return Failure(INVALID_FORMAT);
			case v if(v < 0 || v > 255): return Failure(INVALID_FORMAT);
			case v: bytes.set(i, v);
		}
		return Success(new Address(V4, bytes));
	}
	
	@:to
	public function toString() {
		// TODO
		return this.bytes.toHex();
	}
}

private class Base {
	public var version(default, null):Version;
	public var bytes(default, null):Bytes;
	
	public function new(version, bytes) {
		this.version = version;
		this.bytes = bytes;
	}
}

