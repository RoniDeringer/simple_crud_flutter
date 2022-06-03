import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:simple_crud_flutter/data/dummy_users.dart';

import '../models/user.dart';

class Users with ChangeNotifier {
  // aqui como se fosse o atributo
  final Map<String, User> _items = {...DUMMY_USERS};

//aqui o metodo get
  List<User> get all {
    return [..._items.values];
  }

//qtd de itens de users
  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return; //se nao passar nada nao add
    }
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
        id,
        () => User(
              id: id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl,
            ));
//fazer validacao
  }
}
