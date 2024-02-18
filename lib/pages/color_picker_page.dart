import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color pickerColor = Colors.black;
  Color currentColor = Colors.black;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Now it's time to select a color",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          Column(
            children: [
              Text(
                'This is a example of your task',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Card(
                    color: currentColor,
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
                            children: const [
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
            ],
          ),
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Pick a color '),
                      content: SingleChildScrollView(
                          child: ColorPicker(
                              pickerColor: pickerColor,
                              onColorChanged: changeColor)),
                      actions: [
                        ElevatedButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            setState(() => currentColor = pickerColor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text("Change color", style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoMono',
                ),),
              )),
        ],
      ),
    );
  }
}
