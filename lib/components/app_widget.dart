import 'package:flutter/material.dart';
import '../views/user_list.dart';

class AppWidget extends StatelessWidget {
  //static
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instace,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.cyan,
            brightness: AppController.instace.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          home: UserList(),
        );
      },
    );
  }
}