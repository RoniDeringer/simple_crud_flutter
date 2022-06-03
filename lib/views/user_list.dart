import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_flutter/components/user_tile.dart';
import 'package:simple_crud_flutter/models/user.dart';

import '../provider/users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final Users users = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        actions: [ModoContraste(),],
        title: Text('User'),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: sort_child_properties_last
        child: const Icon(Icons.add),
        onPressed: (){
          // ignore: prefer_const_constructors
          users.put(User(
            name: 'teste',
            email: 'teste@gmail.com',
            avatarUrl: '',
          ));

        },
        backgroundColor: Color.fromARGB(155, 155, 155, 144),
      ),
    );
  }}



  class ModoContraste extends StatelessWidget {
  const ModoContraste({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instace.isDartTheme,
      onChanged: (value) {
        AppController.instace.changeTheme();
      },
    );
  }
}

class AppController extends ChangeNotifier {
  static AppController instace = AppController();
  //Design pattern chamado singleton que é quando cria uma classe
  //estatica dela mesma e instancia ela mesmo
  bool isDartTheme = false;
  changeTheme() {
    isDartTheme = !isDartTheme; //boolean recebe o inverso dele
    notifyListeners();
    return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            brightness: AppController.instace.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
    );
  }
}
