import 'package:flutter/material.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5F6D89),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff5F6D89),
        title: Text(
          'Color Picker',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Now it's time to select a color",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          Text(
            'This is a example of your task',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Card(
                color: Colors.black.withOpacity(0.6),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              value: false,
                              onChanged: (value) {
                                setState(() {
                                  value = false;
                                });
                              },
                            ),
                          ),
                          Text('teste',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: 'NunitoSans')),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 34,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Time left: x hours',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'x h',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Pick a color '),
                    );
                  },
                );
              },
              child: Text("Change color")),
        ],
      ),
    );
  }
}
