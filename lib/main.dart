import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FRC(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class FRC extends StatefulWidget{
  State<FRC> createState() => FRCstate();
}

class FRCstate extends State<FRC>{

String value = "autonomous";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
      body: Stack(
        children: [
          Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton(
              value: value,
              items: <String>[
                'autonomous',
                'teleop'
              ].map((String modo){
                return DropdownMenuItem<String>(
                  value: modo,
                  child: Text(modo));
              }).toList(), 
              onChanged: (String? newValue){
                setState(() {
                  value = newValue!;
                  print("$value");
                });
              }),
          )
        ],
      )
      )
    );    
  }
}