#include <stdio.h>

void g() {
  puts("g()");
}

void f() {
  puts("f()");
  g();
}

void runInC() {
  puts("Hello from runInC");
  f();
}
