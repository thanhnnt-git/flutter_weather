import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/weather.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.locationWeather);
  final locationWeather;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = '';
  String main = '';
  String iconPath = '';
  int temperature = 0;
  double windSpeed = 0.0;
  int humidity = 0;
  String currentDate = '0';
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      var now = new DateTime.now();
      currentDate = '${now.day}-${now.month}-${now.year}';
      print(currentDate);
      cityName = weatherData['name'];
      main = weatherData['weather'][0]['main'];
      iconPath = 'images/' + main.toLowerCase() + '.png';
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      windSpeed = weatherData['wind']['speed'];
      humidity = weatherData['main']['humidity'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundBoxDecoration,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cityName,
                      style: kLabelTextStyle,
                    ),
                    Text(currentDate),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ToggleSwitch(
                    totalSwitches: 2,
                    minWidth: 110,
                    labels: ['Focecast', 'Air quality'],
                    activeBgColor: [Colors.purple],
                    inactiveBgColor: Colors.black12,
                    activeFgColor: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    main,
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image(
                    image: AssetImage(iconPath),
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
                          temperature.toString() + '℃',
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
                          windSpeed.toString() + 'km/h',
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
                          humidity.toString() + '%',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    var typedName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityScreen();
                        },
                      ),
                    );
                    if (typedName != null) {
                      cityName = typedName;
                      WeatherModel weatherModel = WeatherModel();
                      var weatherData =
                          await weatherModel.getCityWeather(cityName);
                      updateUI(weatherData);
                    }
                  },
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
