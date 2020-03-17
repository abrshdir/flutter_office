import 'package:flutter/material.dart';
import 'package:mine_app/ui/utils/database_helper.dart';

import 'package:mine_app/ui/utils/user.dart';

List _users;

void main() async {
  runApp(new MaterialApp(
    title: 'DB',
    home: new Home(),
  ));

  var db = new DatabaseHelper();

  // Add User
 //await db.saveUser(new User("MMimi", "anita"));

  int count = await db.getCount();
  print("count: $count");

  // retrieving User
//  User ana = await db.getUser(1);
//  print('Got username: ${ana.password}');

  //Delete a user
  // int userDeleted = await db.deleteUser(2);

  //Update
//  await db.getUser(1);
//  User anaUpdated = User.fromMap(
//      {"username": "UpdatedAna", "password": "updatedPassword", "id": 1});
//  await db.updateUser(anaUpdated);

  _users = await db.getAllUsers();

  for (int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);
    print("Username: ${user.username}, USer Id: ${user.id}");
  }


}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: new ListView.builder(
          itemCount: _users.length,
          itemBuilder: (_, int position) {
            return new Card(
              color: Colors.white,
              elevation: 2.0,
              child: new ListTile(
                leading: new CircleAvatar(
                  child: new Text("${User.fromMap(_users[position]).username.substring(0, 1)}"),
                ),
                title: new Text(
                    "User: ${User.fromMap(_users[position]).username}"),
                subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"),
                onTap: () => debugPrint("${User.fromMap(_users[position]).password}"),
              ),
            );
          }),
    );
  }
}
