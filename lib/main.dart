import "dart:io" show NetworkInterface, Platform, WebSocket;

import "package:flutter/material.dart";
import "package:window_manager/window_manager.dart";
import 'package:flutter/foundation.dart' show kIsWeb;

//tipo o robotInit ou teleopInit
  void main() async{
    windowManager.ensureInitialized();//garante que tudo esteja pronto antes de iniciar
    if(!kIsWeb && Platform.isWindows){
      await windowManager.ensureInitialized();
      WindowOptions options = const WindowOptions(
        size: Size(500, 450),
        backgroundColor: Colors.green,
        minimumSize: Size(500, 450),
        center: true,
      );

      windowManager.waitUntilReadyToShow(options, () async{
        windowManager.focus();
        windowManager.maximize();
        windowManager.show();
      });
    }
      runApp(const MyApp());
    }

  class MyApp extends StatefulWidget{
    const MyApp({super.key});

    @override
    State<MyApp> createState() => MyAppState();
  }

  class MyAppState extends State<MyApp>{    

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Hyobots FRC table',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: getApp(),
    );
  }

   Widget getApp(){
    if(Platform.isAndroid){
      Stack(
        alignment: Alignment.center,
        children: [
          Text("erro")
        ],
      );
    }
    return widget;
  }
  }