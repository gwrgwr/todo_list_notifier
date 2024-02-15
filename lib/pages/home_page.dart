import 'package:flutter/material.dart';
import 'package:todo_list_notifier/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final Color backgroundColor = Color(0xff5F6D89);

  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            'Todo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w500,
              letterSpacing: 2
            ),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return ListTile(
                title: Text(todo.title),
                leading: Checkbox(
                  value: controller.todos[index].completed,
                  onChanged: (value) {
                    setState(() {
                      controller.todos[index].completed = value!;
                    });
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller.addTodos(
              title: 'teste',
              completed: isCompleted,
              hoursSpent: "13",
              hoursRemaining: '13',
            );
          });
        },
      ),
    );
  }
}
