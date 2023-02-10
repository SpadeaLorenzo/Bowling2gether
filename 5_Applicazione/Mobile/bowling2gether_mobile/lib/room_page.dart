import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vector_math/vector_math.dart';
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
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: ElevatedButton(
              child: const Text("lancia"),
              onPressed: () {
                var t1 = DateTime.now();
                var t2 = DateTime.now();
                double degX = 0.0, degY = 0.0, degZ = 0.0; 
                gyroscopeEvents.listen((GyroscopeEvent event) {
                  t1 = DateTime.now();
                  var deltaTime = t1.difference(t2);
                  degX += event.x * (deltaTime.inMilliseconds / 1000);
                  print(degrees(degX));
                  t2 = DateTime.now();
                });
              },
            ),
          ),
        ),
      ]),
    );
  }
}
