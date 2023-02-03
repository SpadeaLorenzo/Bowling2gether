import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class RoomPage extends StatelessWidget {
  String username;
  RoomPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bowling2gether'),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: const TextStyle(
                fontSize: 50,
                height: 1.5,
              ),
              username,
            )
          ],
        ),
        Expanded(
          child: Center(
            child: ElevatedButton(
              child: const Text("lancia"),
              onPressed: () {
                gyroscopeEvents.listen((GyroscopeEvent event) {
                  print(event);
                  //Output: [GyroscopeEvent (x: 0.08372224867343903, y: -0.09925820678472519, z: 0.21376553177833557)]
                });
              },
            ),
          ),
        ),
      ]),
    );
  }
}
