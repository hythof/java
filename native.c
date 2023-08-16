#include <stdio.h>

void g() {
  puts("g()");
}

void f() {
  g();
  puts("f()");
}

void runInC() {
  f();
  puts("Hello from runInC");
}
