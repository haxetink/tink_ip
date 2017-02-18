package ;

import haxe.unit.*;

class RunTests {

  static function main() {
    
    var r = new TestRunner();
    r.add(new TestV4());
    
    travix.Logger.exit(r.run() ? 0 : 500);
  }
  
}