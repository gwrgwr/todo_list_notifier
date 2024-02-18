import 'package:flutter/material.dart';
import 'package:todo_list_notifier/controllers/home_controller.dart';
import 'package:todo_list_notifier/pages/add_task_page.dart';

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
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            'Todo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              fontFamily: 'NunitoSans',
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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Card(
                    color: Colors.black.withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  value: controller.todos[index].completed,
                                  onChanged: (value) {
                                    setState(() {
                                      controller.todos[index].completed =
                                          value!;
                                    });
                                  },
                                ),
                              ),
                              Text(todo.title,
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
                                'Time left: ${todo.hoursRemaining} hours',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                '${todo.hoursSpent} h',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          'assets/icons/pen_ink.png',
          width: 50,
          height: 50,
        ),
        onPressed: () {
          setState(() {
            controller.addTodos(
              title: 'teste',
              completed: isCompleted,
              hoursSpent: "2",
              hoursRemaining: '11',
              colorCard: Colors.black.withOpacity(0.6),
            );
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AddTaskPage();
              },
            ));
          });
        },
      ),
    );
  }
}
