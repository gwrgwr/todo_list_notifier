import 'package:flutter/material.dart';
import 'package:todo_list_notifier/widgets/date_picker.dart';
import 'package:todo_list_notifier/widgets/number_picker.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTaskPage> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController hoursSpentController = TextEditingController();
  TextEditingController hoursRemainingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Color(0xff5F6D89);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text('Add task', style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w500,
          fontFamily: 'NunitoSans'
        ),),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: SizedBox(
          height: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                cursorColor: Colors.white,
                controller: taskNameController,
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  label: Center(
                    child: Text(
                      'Task name',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  hintText: "Task",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 133, 133, 133),
                    fontSize: 20,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              NumberPickerWidget(),
              DatePickerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
