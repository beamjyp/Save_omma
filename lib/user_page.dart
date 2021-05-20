import 'package:flutter/material.dart';

class User_page extends StatefulWidget {
  User_page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _User_page createState() => _User_page();
}

class _User_page extends State<User_page> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('test'),
                accountEmail: Text('test'),
                currentAccountPicture: CircleAvatar(
                  child: FlutterLogo(
                    size: 42.0,
                  ),
                  backgroundColor: Colors.white,
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    child: Text("N"),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                  ),
                  CircleAvatar(
                    child: Icon(Icons.add),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey,
                  )
                ],
              ),
              ListTile(title: Text('Item 1'), onTap: () {}),
              ListTile(
                title: Text('Item 2'),
                onTap: () {},
              ),
              Divider(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ListTile(
                    title: Text('Item 3'),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
