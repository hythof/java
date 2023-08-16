all:
	clang -shared -undefined dynamic_lookup -o libsandbox.so -fpic sandbox.c
	clang main.c libsandbox.so
	./a.out
	(cd com.example.sandbox && mvn compile && cd target/classes && CLASSPATH=".:../../../jna.jar" java com.example.sandbox.App `pwd`/../../../libsandbox.so)
