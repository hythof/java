all:
	clang -shared -undefined dynamic_lookup -o libnative.so -fpic native.c
	clang main.c libnative.so
	LD_LIBRARY_PATH=`pwd` ./a.out
	(cd com.example.sandbox && mvn install && cd target/classes && CLASSPATH=".:../../../:../../../jna.jar" java com.example.sandbox.App `pwd`/../../../libnative.so)
