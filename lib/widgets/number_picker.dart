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
                Color.fromARGB(255, 95, 15, 185),
                Color.fromARGB(255, 100, 33, 163),
                Color.fromARGB(255, 61, 14, 92)
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hours to Spent: ',
            style: TextStyle(
                color: Colors.white, fontFamily: 'RobotoMono', fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Hours',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                  NumberPicker(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(color: Colors.black))),
                      haptics: true,
                      selectedTextStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 28),
                      textStyle: TextStyle(color: Colors.black, fontSize: 20),
                      infiniteLoop: true,
                      minValue: 0,
                      maxValue: 99,
                      value: _currentValueHour,
                      onChanged: (value) {
                        setState(() {
                          _currentValueHour = value;
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Minutes',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                  NumberPicker(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(color: Colors.black))),
                      haptics: true,
                      selectedTextStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 28),
                      textStyle: TextStyle(color: Colors.black, fontSize: 20),
                      infiniteLoop: true,
                      minValue: 0,
                      maxValue: 59,
                      value: _currentValueMinute,
                      onChanged: (value) {
                        setState(() {
                          _currentValueMinute = value;
                        });
                      }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
