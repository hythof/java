package com.example.sandbox;

import com.sun.jna.Library;
import com.sun.jna.Native;

interface NativeLibrary extends Library {
  NativeLibrary INSTANCE = Native.load("native", NativeLibrary.class);
  void runInC();
}

public class App
{
    public static void main( String[] args )
    {
        System.out.println("try to load '" + args[0] + "'");
        System.load(args[0]); // absolute path to libnative.so
        System.out.println("try to call runInC");
        NativeLibrary.INSTANCE.runInC();
    }
}
