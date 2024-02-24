import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.agvScreen, {super.key});
  
  final void Function() agvScreen;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Image.asset(
          'assets/images/MarCO-lightlogo.png',
          width: 400,
          ),
          const SizedBox(height: 120),
          const Text("Select Device",
            style: TextStyle(             
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  ),
            ),
          const Divider(
                  color: Color.fromARGB(255, 0, 0, 0),
                  thickness: 2.0,
                  indent: 30,
                  endIndent: 30,
              ),  
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "AGV LiftAnt",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 43, 43, 43),
                    ),
              ),
              const SizedBox(width: 10),
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      agvScreen();
                    },
                    color: Colors.white,
                    iconSize: 50,
                  ),
                )
            ],
          ),
          const Text(
                "Something else..    ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 43, 43, 43),
                    ),
              ),
              const Text(
                "Something else..    ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 43, 43, 43),
                    ),
              ),
              const Text(
                "Something else..    ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 43, 43, 43),
                    ),
              ),
        ],
      ),
    );
  }

}