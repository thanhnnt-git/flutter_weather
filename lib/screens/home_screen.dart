import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'San Francisco',
                    style: kCityNameTextStyle,
                  ),
                  Text('Sep 9, 2021', style: kDate),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: ToggleSwitch(
                  totalSwitches: 2,
                  minWidth: 110,
                  labels: ['Focecast', 'Air quality'],
                  activeBgColor: [Colors.blue],
                  inactiveBgColor: Colors.black12,
                  activeFgColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.wb_sunny,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Temp',
                        style: kDate,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '75',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Wind',
                        style: kDate,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '75',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Humidity',
                        style: kDate,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '75',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: kTextFieldInputDecoration,
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
