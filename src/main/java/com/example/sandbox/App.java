package com.example.sandbox;

import com.sun.jna.Library;
import com.sun.jna.Native;

interface WovnLib extends Library {
  WovnLib INSTANCE = (WovnLib)Native.loadLibrary("sandbox", WovnLib.class);
  void runInC();
}

public class App
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        System.out.println("try to load libsandbox.so");
        System.load(args[0]); // absolute path of libsandbox.so
        System.out.println("try to call runInC");
        WovnLib.INSTANCE.runInC();
    }
}
