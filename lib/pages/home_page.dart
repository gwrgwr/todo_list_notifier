import 'package:flutter/material.dart';
import 'package:todo_list_notifier/controllers/task_controller.dart';
import 'package:todo_list_notifier/data/background_color.dart';
import 'package:todo_list_notifier/models/categories_task_model.dart';
import 'package:todo_list_notifier/models/drawer_list_mode.dart';
import 'package:todo_list_notifier/widgets/list_builder_task.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.name, super.key});

  final TextEditingController name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DrawerList> list = [];
  List<CategorieTask> categories = [];
  void _getLists() {
    list = DrawerList.getDrawerList();
    categories = CategorieTask.getCategories();
  }

  final TextEditingController taskNameController = TextEditingController();
  final TaskController _taskController = TaskController();

  bool? isFinished = false;

  @override
  void initState() {
    super.initState();
    _taskController.taskList.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _getLists();
    final bgColorLight = BackgroundColor.of(context)!.backgroundColorLight;
    final bgColorDark = BackgroundColor.of(context)!.backgroundColorDark;
    final bgPink = BackgroundColor.of(context)!.pinkColor;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      key: _key,
      backgroundColor: bgColorLight,
      drawer: _sectionDrawer(bgColorDark, _key),
      appBar: _sectionAppBar(bgColorLight, _key),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's up, ${widget.name.text}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NunitoSans'),
              ),
              SizedBox(height: 40),
              Text(
                'Categories',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 20,
                    fontFamily: 'RobotoMono'),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: bgColorDark,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categories[index].amount,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    fontSize: 18,
                                    fontFamily: 'RobotoMono'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                categories[index].type,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'NunitoSans'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemCount: categories.length),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'All Tasks',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 20,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  Text(
                    '${_taskController.taskList.value.length} tasks',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 20,
                      fontFamily: 'RobotoMono',
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              AnimatedBuilder(
                animation: _taskController.taskList,
                builder: (context, child) {
                  return _taskController.taskList.value.isEmpty
                      ? Center(
                          child: Text(
                            'No task registered yet',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 20,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: _taskController.taskList.value.length,
                            itemBuilder: (context, index) {
                              return ListBuilderTask(
                                taskItem: _taskController.taskList.value[index],
                                onDelete: () {
                                  setState(() {
                                    _taskController.removeTask(
                                      _taskController.taskList.value[index],
                                    );
                                  });
                                },
                              );
                            },
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _sectionFloatingActionButton(
          bgPink, context, bgColorLight, bgColorDark),
    );
  }

  FloatingActionButton _sectionFloatingActionButton(Color bgPink,
      BuildContext context, Color bgColorLight, Color bgColorDark) {
    return FloatingActionButton(
      backgroundColor: bgPink,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 2,
              scrollable: true,
              backgroundColor: bgColorLight,
              content: SizedBox(
                height: 400,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Add new task',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 20,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                    TextField(
                      controller: taskNameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "new item",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        taskNameController.text.isEmpty
                            ? null
                            : _taskController.addTask(taskNameController.text);
                        taskNameController.clear();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                        decoration: BoxDecoration(
                            color: bgColorDark,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  AppBar _sectionAppBar(Color? bgColorLight, GlobalKey<ScaffoldState> _key) {
    return AppBar(
      backgroundColor: bgColorLight,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white.withOpacity(0.4),
        ),
        onPressed: () {
          _key.currentState!.openDrawer();
        },
      ),
      actions: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.4),
                )),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white.withOpacity(0.4),
                ))
          ],
        )
      ],
    );
  }

  Drawer _sectionDrawer(Color bgColorDark, GlobalKey<ScaffoldState> _key) {
    return Drawer(
      backgroundColor: bgColorDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.4),
                    )),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _key.currentState!.closeDrawer();
                  },
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                width: 200,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            list[index].icon,
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              list[index].name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 40,
                        ),
                    itemCount: list.length),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Google',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
