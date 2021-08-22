import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ImageUrl =
        "https://media-exp1.licdn.com/dms/image/C4E03AQHI_cSi5ZO1cQ/profile-displayphoto-shrink_400_400/0/1599803660458?e=1634774400&v=beta&t=Adj0oUvv1dxbsruBVJ2_CWsAqkwIxog6jaO-FEfR_Es";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text(
                "Panav Sinha",
                style: TextStyle(
                  fontSize: 18.5,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                "panavsinha15@gmail.com",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(ImageUrl),
              ),
              otherAccountsPictures: [],
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 18.5,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 18.5,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 18.5,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
