import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fluttermvcexample/models/user.dart';
import 'package:http/http.dart' as http;

class UserDataService extends ChangeNotifier{
  String userUrl = 'https://reqres.in/api/users';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<User> users = [];

  Future<List<User>> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(userUrl).catchError((e) {
      print('Error Fetching Users');
    });

    if(result.statusCode == 200){
      Map<String, dynamic> data;
      data = json.decode(result.body);
      var _users = data["data"];
      if (_users != null) {
        for (var user in _users) {
          print(user);
          users.add(User.fromMap(user));
        }
      }
      _isLoading = false;
      notifyListeners();
      return users;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }
}
