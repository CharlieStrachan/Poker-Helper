import 'package:flutter/material.dart';
import 'dart:async';

class GamePage extends StatefulWidget {
  final int time;
  final int smallBlind;
  final int bigBlind;
  const GamePage({super.key, required this.time, required this.smallBlind, required this.bigBlind});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final Timer timer;

  late int smallBlind = widget.smallBlind;
  late int bigBlind = widget.bigBlind;

  late int minutes = widget.time -1;
  int seconds = 59;

  @override
  void initState() {  
    super.initState();  
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$minutes:${seconds < 10? "0$seconds" : seconds}", style: TextStyle(fontSize: 50)),
            Text("Small Blind: $smallBlind", style: TextStyle(fontSize: 20)),
            Text("Big Blind $bigBlind", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        --seconds;
        if (seconds < 0 && minutes > 0) {
          --minutes;
          seconds = 59;
        }
        if (seconds == 0 && minutes == 0) {
          smallBlind *= 2;
          bigBlind *= 2;
          timer.cancel();
          startTimer();
        }
      });
    });
  }
}
