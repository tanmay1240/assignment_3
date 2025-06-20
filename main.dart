import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: MoodCounter(), debugShowCheckedModeBanner: false));
}

class MoodCounter extends StatefulWidget {
  @override
  _MoodCounterState createState() => _MoodCounterState();
}

class _MoodCounterState extends State<MoodCounter> {
  int counter = 0;
  Color bgColor = Colors.white;

  // Get emoji based on counter value
  String getMoodEmoji() {
    if (counter < 3) return '😐';
    if (counter < 6) return '🙂';
    if (counter < 10) return '😄';
    return '🤩';
  }

  void updateUI() {
    setState(() {
      counter++;
      bgColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: Text('Mood Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(getMoodEmoji(), style: TextStyle(fontSize: 60)),
            SizedBox(height: 20),
            Text('Count: $counter', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: updateUI, child: Text('Increase')),
          ],
        ),
      ),
    );
  }
}
