#!/usr/bin/env xcrun swift -i

println("Process.arguments gave args:")
for s in Process.arguments {
  println(s)
}
