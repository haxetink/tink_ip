package ;

import tink.ip.*;
using tink.CoreApi;

class RunTests {

  static function main() {
    var ip = Address.parse('127.0.0.1');
    travix.Logger.println(ip.sure());
    travix.Logger.exit(0); // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
  }
  
}