use allegro5



import allegro5/Allegro
import allegro5/AllegroFile
import allegro5/AllegroThread
import allegro5/Altime
import allegro5/DisplayMode
import allegro5/Event
import allegro5/Joystick
import allegro5/Monitor
import allegro5/Mouse
import allegro5/Path
import allegro5/Timer
import allegro5/Touch
import allegro5/Transform
import allegro5/UString

import allegro5/Acodec
import allegro5/Audio


import structs/ArrayList


Test : class {
  message : String
  ok      : Bool
  init    : func(=ok, =message)
}

TestSuite : class {
  count   : Int
  failed  : Int
  tests   : ArrayList<Test>

  init : func () {
    count  = 0
    failed = 0
    tests  = ArrayList<Test> new()
  }
  
  report : func () {
    success := count - failed
    if (failed == 0) { 
      "[ OK ]: %d/%d tests OK\n" printf(success, count)
    } else {
      "[FAIL]: %d/%d tests OK\n" printf(success, count)
    }
  }

  test : func (ok : Bool, message : String) -> Bool {
    tests add(Test new(ok, message))
    count += 1
    if (!ok) { 
      failed += 1
      "Test %d failed: %s\n" printf(count, message)
    }
    return ok
  }
  
  test : func~notnull (ptr : Pointer) -> Bool {
    ok : Bool
    ok = (ptr != null)
    return test(ok, "Pointer may not be null")
  }
  
  test : func~uint32_equal(i1, i2 :  UInt32) -> Bool {
    ok := (i1 == i2)
    return test(ok, "Integers should be equal: %d %d" format(i1, i2))
  }
}


main : func() -> Int {
  suite   := TestSuite new()
  alok    := Al init()
  suite test(alok, "Allegro not initialized");
 
  us      := UString new("Hello")
  timeout : Timeout
  timeout init(2.0)
  ptr := Al malloc(123)
  suite test~notnull(ptr)
  Al free(ptr)
  suite test(Al getVersion() , ALLEGRO_VERSION_INT);
  suite report()
  us free()
  "All done!" println()
  return 0
}



