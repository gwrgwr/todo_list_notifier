import 'package:flutter/material.dart';
import 'package:todo_list_notifier/pages/color_picker_page.dart';
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
        title: Text(
          'Add task',
          style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'NunitoSans'),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 720,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  controller: taskNameController,
                  decoration: InputDecoration(
                    label: Text(
                      'Task name',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    hintText: "Task",
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 133, 133, 133),
                      fontSize: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                NumberPickerWidget(),
                DatePickerWidget(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return ColorPickerPage();
                          },
                        ));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.deepPurple.withOpacity(0.9)),
                        child: Text(
                          'Proceed',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
