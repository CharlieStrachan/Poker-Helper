import 'package:flutter/material.dart';
import 'dart:async';

import 'package:namer_app/game.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  int time = 15;
  int smallBlind = 25;
  int bigBlind = 50;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: time.toString()),
                decoration: InputDecoration(
                  labelText: 'Time between blinds (minutes)',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  time = int.tryParse(value) ?? 0;
                },
              ),
              TextField(
                controller: TextEditingController(text: smallBlind.toString()),
                decoration: InputDecoration(
                  labelText: 'Small Blind',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  smallBlind = int.tryParse(value) ?? 0;
                },
              ),
              TextField(
                controller: TextEditingController(text: bigBlind.toString()),
                decoration: InputDecoration(
                  labelText: 'Big Blind',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  bigBlind = int.tryParse(value) ?? 0;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (time > 0 && smallBlind > 0 && bigBlind > smallBlind) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GamePage(time: time, smallBlind: smallBlind, bigBlind: bigBlind),
                        ),
                      );
                    }
                  },
                  child: Text("Start")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}