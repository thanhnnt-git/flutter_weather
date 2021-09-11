import 'package:flutter/material.dart';

const kLabelTextStyle = TextStyle(fontSize: 30.0, color: Colors.white);
const kLabelTextStyle2 = TextStyle(color: Colors.grey);

const kBackgroundBoxDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/background.jpeg'),
    fit: BoxFit.cover,
  ),
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.travel_explore,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal, width: 0.0)),
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
);
