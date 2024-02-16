import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatefulWidget {
  const NumberPickerWidget({super.key});

  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  int _currentValueHour = 0;
  int _currentValueMinute = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color.fromARGB(255, 64, 79, 110),
                Color.fromARGB(255, 77, 94, 129),
                Color.fromARGB(255, 91, 110, 148),
                Color.fromARGB(255, 77, 94, 129),
                Color.fromARGB(255, 64, 79, 110)
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hours to Spent: ',
            style: TextStyle(
                color: Colors.white, fontFamily: 'RobotoMono', fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NumberPicker(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.black))),
                  haptics: true,
                  selectedTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 28),
                  textStyle: TextStyle(color: Colors.black, fontSize: 20),
                  infiniteLoop: false,
                  minValue: 0,
                  maxValue: 12,
                  value: _currentValueHour,
                  onChanged: (value) {
                    setState(() {
                      _currentValueHour = value;
                    });
                  }),
              NumberPicker(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.black))),
                  haptics: true,
                  selectedTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 28),
                  textStyle: TextStyle(color: Colors.black, fontSize: 20),
                  infiniteLoop: false,
                  minValue: 0,
                  maxValue: 59,
                  value: _currentValueMinute,
                  onChanged: (value) {
                    setState(() {
                      _currentValueMinute = value;
                    });
                  })
            ],
          ),
          Text("Spending ${valueHoursHigher()} : ${valueMinutesHigher()} hours in this task", style: TextStyle(
            color: Colors.white,
            fontSize: 17
          ),),
        ],
      ),
    );
  }

  dynamic valueHoursHigher() {
    if (_currentValueHour <= 9) {
      return "0$_currentValueHour";
    } else {
      return _currentValueHour;
    }
  }

  dynamic valueMinutesHigher() {
    if (_currentValueMinute <= 9) {
      return "0$_currentValueMinute";
    } else {
      return _currentValueMinute;
    }
  }
}
