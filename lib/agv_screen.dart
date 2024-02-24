import "package:flutter/material.dart";
import "package:marco_test1/marco_app.dart";

class ControllerScreen extends StatefulWidget{

  const ControllerScreen({super.key});
  
  @override
  State<ControllerScreen> createState() {
    return _ControllerScreenState();
  }
}

class _ControllerScreenState extends State<ControllerScreen>{

  bool _isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AGV LiftAnt', style: TextStyle(fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MarcoApp()),
                (route) => false
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Bluetooth Status Information
              const Row(
                children: [
                  SizedBox(width: 80),
                  Text(
                    'Bluetooth:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(width: 20),

                  BluetoothConnectionWidget()
                ],
              ),

              // Online/Offline Switch
              SwitchListTile(
                title: const Text('Otonom Offline/Online'),
                value: _isOnline, // Set the initial value as needed
                onChanged: (value) {
                  //8888
                  setState(() {
                    _isOnline = value;
                  });
                },
              ),

              const Divider(
                  color: Colors.grey,
                  thickness: 5.0,
              ),
              // Forward, Left, Right, Backward Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Forward button
                    },
                    child: const Icon(Icons.arrow_upward),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Left Button
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Stop button
                    },
                    child: const Icon(Icons.stop),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Right button
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Backward button
                    },
                    child: const Icon(Icons.arrow_downward),
                  ),
                ],
              ),
            
              const Divider(
                  color: Colors.grey,
                  thickness: 5.0,
              ),

              // Lift-Up, Stop, Lift-Down Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Lift-Up button
                    },
                    child: const Text('Lift-Up'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Stop button
                    },
                    child: const Text('Stop'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Lift-Down button
                    },
                    child: const Text('Lift-Down'),
                  ),
                ],
              ),
    
               ConstrainedBox(
                constraints: const BoxConstraints(
                        minWidth: 70, 
                        minHeight: 70,
                        maxWidth: 150, 
                        maxHeight: 150,
                        ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text('Speed:' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                      SliderForSpeed()
                     ],
              ),
              )
              
            ],
          ),
        )
    );
  }


}


class BluetoothConnectionWidget extends StatefulWidget {
  const BluetoothConnectionWidget({super.key});

  @override
  _BluetoothConnectionWidgetState createState() =>
      _BluetoothConnectionWidgetState();
}

class _BluetoothConnectionWidgetState
    extends State<BluetoothConnectionWidget> {
  bool _isConnecting = false;
  bool _isConnected = false;

  void _connect() {
    setState(() {
      _isConnecting = true;
      _isConnected = false;
    });

    // Add your Bluetooth connection logic here.
    // For demonstration purposes, let's use a delayed future to simulate connection.
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isConnecting = false;
        _isConnected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _connect();
          },
          child: _isConnecting
              ? const Text('Connecting...')
              : _isConnected
                  ? const Text('Connected')
                  : const Text('Not Connected'),
        ),
      ],
    );
  }
}

class SliderForSpeed extends StatefulWidget {
  const SliderForSpeed({super.key});

  @override
  State<SliderForSpeed> createState() => _SliderForSpeedState();
}

class _SliderForSpeedState extends State<SliderForSpeed> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return 
       Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 4,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      );
  }
}
