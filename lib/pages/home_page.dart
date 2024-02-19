import 'package:flutter/material.dart';
import 'package:todo_list_notifier/data/background_color.dart';
import 'package:todo_list_notifier/models/drawer_list_mode.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.name, super.key});

  final TextEditingController name;

  List<DrawerList> list = [];

  void _getList() {
    list = DrawerList.getDrawerList();
  }

  @override
  Widget build(BuildContext context) {
    _getList();
    final bgColorLight = BackgroundColor.of(context)?.backgroundColorLight;
    final bgColorDark = BackgroundColor.of(context)!.backgroundColorDark;
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      key: _key,
      backgroundColor: bgColorLight,
      drawer: Drawer(
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
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: bgColorLight,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                list[index].icon,
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  list[index].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                      itemCount: list.length),
                )
              ],
            ),
            Text('Google')
          ],
        ),
      ),
      appBar: AppBar(
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
      ),
    );
  }
}
