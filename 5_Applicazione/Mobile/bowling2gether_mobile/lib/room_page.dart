import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:math' as math;
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
          child: const Center(child: ThrowButton()),
        ),
      ]),
    );
  }
}

class ThrowButton extends StatefulWidget {
  const ThrowButton({super.key});

  @override
  State<ThrowButton> createState() => _ThrowButtonState();
}

class _ThrowButtonState extends State<ThrowButton> {
  double orientation = 0.0;
  double speed = 0.0;
  String imagePath = 'assets/bowlingBall2.png';

  StreamSubscription? _gyroStreamSubscription;
  List<AccelerometerEvent> _accelerometerEvents = [];
  StreamSubscription<AccelerometerEvent>? _accelerometerStreamSubscription;
  Vector3 linearAcceleration = Vector3(0, 0, 0);
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  Duration? difference;

  @override
  void _calculateMagnitudeAndDirection() {
    double sumX = 0;
    double sumY = 0;
    double sumZ = 0;

    for (AccelerometerEvent event in _accelerometerEvents) {
      sumX += event.x;
      sumY += event.y;
      sumZ += event.z;
    }

    double averageX = sumX / _accelerometerEvents.length;
    double averageY = sumY / _accelerometerEvents.length;
    double averageZ = sumZ / _accelerometerEvents.length;
    linearAcceleration = Vector3(averageX, averageY, averageZ); 
  }

  Widget build(BuildContext context) {
    return SizedBox(
      child: Listener(
        onPointerDown: (event) {
          setState(() {
            imagePath = 'assets/bowlingBall2Click.png';
          });
          startTime = DateTime.now();
          _accelerometerEvents = [];
          var t1 = DateTime.now();
          var t2 = DateTime.now();
          double degX = 0.0;
          _gyroStreamSubscription =
              gyroscopeEvents.listen((GyroscopeEvent event) {
            t1 = DateTime.now();
            var deltaTime = t1.difference(t2);
            degX += event.x * (deltaTime.inMilliseconds / 1000);
            setState(() {
              orientation = degrees(degX);
            });
            t2 = DateTime.now();
          });
          _accelerometerStreamSubscription =
              accelerometerEvents.listen((AccelerometerEvent event) {
            setState(() {
              _accelerometerEvents.add(event);
            });
          });
        },
        onPointerUp: (event) {
          setState(() {
            imagePath = 'assets/bowlingBall2.png';
          });
          endTime = DateTime.now();
          difference = startTime.difference(endTime);
          _gyroStreamSubscription?.cancel();
          _accelerometerStreamSubscription?.cancel();
          _calculateMagnitudeAndDirection();
        },
        child: Image(
          image: AssetImage(imagePath),
          width: 250,
          height: 250,
        )
      ),
    );
  }
}
