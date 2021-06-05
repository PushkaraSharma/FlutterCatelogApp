import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  final profileImageUrl =
      "https://media-exp1.licdn.com/dms/image/C4E03AQG7990KN9xRXQ/profile-displayphoto-shrink_200_200/0/1600194891158?e=1628121600&v=beta&t=E73k3aG2znWh-RvPt6kMBMmWl9RMBwz0HR9vMfyi7qw";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Pushkara"),
                  accountEmail: Text("Pushkarasharma11@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(profileImageUrl)),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text("Setting",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
