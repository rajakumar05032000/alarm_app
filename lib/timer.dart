import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Alarm Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Timer(),
    );
  }
}

class Timer extends StatefulWidget {
  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
// creating text ediiting controller to take hour
// and minute as input
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Rk-Alarm App'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        SizedBox(height: 20),
        Text(
          "Timer",
          style: TextStyle(
              fontSize: 46.0,
              height: 2.0,
              color: Colors.black,
              fontFamily: "Varela"),
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 130,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(11)),
              child: Center(
                child: TextField(
                    style: TextStyle(
                        fontSize: 65.0, height: 2.0, color: Colors.black),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 25, bottom: 25, top: 11, right: 25),
                        hintText: "Hint here"),
                    controller: hourController,
                    keyboardType: TextInputType.number,
                    showCursor: false),
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 90,
              width: 130,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(11)),
              child: Center(
                child: TextField(
                    style: TextStyle(
                        fontSize: 65.0, height: 3.0, color: Colors.black),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 25, bottom: 25, top: 11, right: 25),
                        hintText: "Hint here"),
                    controller: minuteController,
                    keyboardType: TextInputType.number,
                    showCursor: false),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        Container(
          margin: const EdgeInsets.all(25),
          child: ElevatedButton(
              child: const Text(
                'Create timer',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                int minutes;
                minutes = int.parse(minuteController.text);

                int hours;
                hours = int.parse(hourController.text) * 60;

                minutes = minutes + hours;

                // create timer
                FlutterAlarmClock.createTimer(minutes);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AboutDialog(
                        children: [
                          Center(
                            child: Text("Timer is set",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          )
                        ],
                      );
                    });
              }),
        ),
        ElevatedButton(
          onPressed: () {
            // show timers
            FlutterAlarmClock.showTimers();
          },
          child: Text(
            "Show Timers",
            style: TextStyle(fontSize: 20),
          ),
        )
      ])),
    );
  }
}
