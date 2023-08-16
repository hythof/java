all:
	make compile
	make run

compile:
	clang -shared -undefined dynamic_lookup -o libnative.so -fpic native.c
	clang main.c libnative.so
	(cd com.example.sandbox && mvn compile)

run:
	LD_LIBRARY_PATH=`pwd` ./a.out
	(cd com.example.sandbox/target/classes && CLASSPATH=".:../../../:../../../jna.jar" java com.example.sandbox.App)
