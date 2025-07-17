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
        home: Scaffold(
          appBar: AppBar(
            title: Text("Hyobots table"),
            backgroundColor: Colors.lightBlue,
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              DropdownButton(
                value: modo,
                items: <String>[
                    'autonomous',
                    'teleop',
                    'disable',
                    'simulation',
                    'test'
                ].map((String value){
                  return DropdownMenuItem(
                    value: value,
                     child: Text(value));
                }).toList(), 
                onChanged: (String? newMode){
                  setState(() {
                    modo = newMode!;
                    print("o modo é o $modo");
                  });
                })
            ],
          ),
        )
      );  
  }
  }