import 'dart:async';
import 'dart:ffi';
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
          child: Center(child: ThrowButton()),
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
    setState(() {
          // _magnitude = math.sqrt(
          // math.pow(averageX, 2) + math.pow(averageY, 2) + math.pow(averageZ, 2));

      // if (_magnitude > 2) {
      //   if (averageX.abs() > averageY.abs() && averageX.abs() > averageZ.abs()) {
      //     _direction = averageX > 0 ? "Destra" : "Sinistra";
      //   } else if (averageY.abs() > averageX.abs() &&
      //       averageY.abs() > averageZ.abs()) {
      //     _direction = averageY > 0 ? "Su" : "Giù";
      //   } else {
      //     _direction = averageZ > 0 ? "Indietro" : "Avanti";
      //   }
      // } else {
      //   _direction = "";
      // }
    });
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Listener(
          onPointerDown: (event) {
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
              //print(orientation);
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
            endTime = DateTime.now();
            difference = startTime.difference(endTime);
            _gyroStreamSubscription?.cancel();
            _accelerometerStreamSubscription?.cancel();
            _calculateMagnitudeAndDirection();
          },
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("lancia"),
          ),
        ),
        Text("${orientation.round()} ${linearAcceleration..ceil()} ${difference}"),
      ],
    );
  }
}
