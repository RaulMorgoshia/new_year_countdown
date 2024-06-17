import 'dart:async';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? _timer;
  Duration _duration = Duration();

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    DateTime newYear = DateTime(DateTime.now().year + 1, 1, 1);
    _duration = newYear.difference(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _duration = _duration - Duration(seconds: 1);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    int days = duration.inDays;
    int hours = duration.inHours % 24;
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;
    return '${days} დღე ${hours} საათი ${minutes} წუთი ${seconds} წამი';
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white38,
          title: Text('ახალ წლამდე დარჩენილია'),
        ),
        backgroundColor: Colors.white, // Set your desired background color here
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 100,
                    left: 0,
                    bottom: 0), // Adjust top and left padding as needed
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    _formatDuration(_duration),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
