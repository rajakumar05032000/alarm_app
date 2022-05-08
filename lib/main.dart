import 'package:alarm_app/timer.dart';
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
      home: pagv(),
    );
  }
}

class pagv extends StatelessWidget {
  const pagv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(children: [MyHomePage(), Timer()]),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          "Alarm",
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
              onPressed: () {
                int hour;
                int minutes;
                hour = int.parse(hourController.text);
                minutes = int.parse(minuteController.text);

                // creating alarm after converting hour
                // and minute into integer
                FlutterAlarmClock.createAlarm(hour, minutes);
              },
              child: const Text(
                'Create Alarm',
                style: TextStyle(fontSize: 20.0),
              ),
            )),
        ElevatedButton(
          onPressed: () {
            // show alarm
            FlutterAlarmClock.showAlarms();
          },
          child: const Text(
            'Show Alarms',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ])),
    );
  }
}
