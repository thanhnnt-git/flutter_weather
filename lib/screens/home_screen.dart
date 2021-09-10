import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.locationWeather);
  final locationWeather;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sep 9, 2021'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'San Francisco',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
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
                    activeBgColor: [Colors.orange],
                    inactiveBgColor: Colors.black12,
                    activeFgColor: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Cloudy',
                    style: TextStyle(fontSize: 50),
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
                        ),
                        SizedBox(height: 5),
                        Text(
                          '75',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Wind',
                        ),
                        SizedBox(height: 5),
                        Text(
                          '75',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Humidity',
                        ),
                        SizedBox(height: 5),
                        Text(
                          '75',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      Text(
                        ' Search',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
