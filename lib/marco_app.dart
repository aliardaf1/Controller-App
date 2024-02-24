import "package:flutter/material.dart";
import "package:marco_test1/start_screen.dart";
import "package:marco_test1/agv_screen.dart";

class MarcoApp extends StatefulWidget{

  const MarcoApp({super.key});
  
  @override
  State<MarcoApp> createState() {
    return _MarcoAppState();
  }
}

class _MarcoAppState extends State<MarcoApp>{
  Widget? activeScreen;
  
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = const ControllerScreen();
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 95, 72, 227) , Color.fromARGB(255, 186, 130, 232)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              ),
          ),
          child: activeScreen
        ),
      ),
    );
  }


}