package ;

import tink.ip.*;

class RunTests {

  static function main() {
    var ip:IpAddress = '127.0.0.1';
    travix.Logger.println(ip);
    travix.Logger.exit(0); // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
  }
  
}