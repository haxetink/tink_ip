package;

import haxe.unit.*;
import tink.ip.*;

using tink.CoreApi;

class TestV4 extends TestCase {
	
	public function testParse() {
		assertSuccess(Address.parse('127.0.0.1'));
		assertSuccess(Address.parse('0.0.0.0'));
		
		assertFailure(Address.parse(''));
		assertFailure(Address.parse('127.0.0.1.1'));
		assertFailure(Address.parse('127.0.0'));
		assertFailure(Address.parse('256.0.0.0'));
	}
	
	public function testStringify() {
		assertEquals('127.0.0.1', Address.parse('127.0.0.1').sure());
	}
	
	function assertSuccess<T>(outcome:Outcome<T, Error>) {
		assertTrue(outcome.isSuccess());
	}
	function assertFailure<T>(outcome:Outcome<T, Error>) {
		assertFalse(outcome.isSuccess());
	}
}