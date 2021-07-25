import 'package:flutter/material.dart';
import 'package:fluttermvcexample/models/user.dart';
import 'package:fluttermvcexample/services/user_data_service.dart';
import 'package:provider/provider.dart';

import '../locators.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    locator<UserDataService>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    List<Data>? users = Provider.of<UserDataService>(context).users;
    bool isLoading = Provider.of<UserDataService>(context).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Demo'),
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Image.network(users[index].avatar!),
                    title: Text(
                      users[index].firstName! + " " + users[index].lastName!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    subtitle: Text(
                      users[index].email!,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: Text('ID: ' + users[index].id.toString()),
                  ),
                );
              }),
    );
  }
}
