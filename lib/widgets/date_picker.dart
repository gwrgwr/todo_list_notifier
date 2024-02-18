import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("FINAL DATE:", style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),),
        SizedBox(height: 20,),
        TextField(
          controller: _dateController,
          decoration: InputDecoration(
              labelText: "DATE",
              floatingLabelStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              filled: true,
              fillColor: Colors.deepPurple.withOpacity(0.5),
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2))),
          readOnly: true,
          onTap: () => _selectDate(),
        )
      ],
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
