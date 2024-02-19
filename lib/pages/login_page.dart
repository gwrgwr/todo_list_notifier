import 'package:flutter/material.dart';
import 'package:todo_list_notifier/data/background_color.dart';
import 'package:todo_list_notifier/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController namePersonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bgColorDark = BackgroundColor.of(context)!.backgroundColorDark;
    final pinkColor = BackgroundColor.of(context)!.pinkColor;

    return Scaffold(
      backgroundColor: bgColorDark,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ENTER YOUR USERNAME',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: namePersonController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: bgColorDark,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: pinkColor,
                        width: 3,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  hintText: "username",
                  hintStyle: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return HomePage(name: namePersonController);
                    },
                  ));
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: pinkColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Text(
                      "Let's Start",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )))
          ],
        ),
      ),
    );
  }
}
