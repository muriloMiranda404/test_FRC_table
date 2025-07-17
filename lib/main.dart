import "dart:io";

import "package:flutter/material.dart";
import "package:window_manager/window_manager.dart";

//tipo o robotInit ou teleopInit
  void main() async{
    windowManager.ensureInitialized();//garante que tudo esteja pronto antes de iniciar
    if(Platform.isWindows){
      await windowManager.ensureInitialized();
    }

    }

  class MyApp extends StatefulWidget{
    const MyApp({super.key});

    @override
    State<MyApp> createState() => MyAppState();
  }

  class MyAppState extends State<MyApp>{
    String modo = "autonomous";
    

  @override
  Widget build(BuildContext context){
    return MaterialApp(

    );
  }
  }