import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_app_final/constants/constants.dart';
import 'package:medical_app_final/pages/home_page.dart';
import 'package:medical_app_final/pages/test_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(kUserName),
            accountEmail: const Text(kUserEmail),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/girl.jpg',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: kAppColor,
              // image: DecorationImage(image: )
            ),
          ),
          buildMenuItem(
              title: 'Home',
              icon: Icons.home,
              onClick: () => selectedItem(context, 0)),
          buildMenuItem(
              title: 'Get The Test',
              icon: Icons.troubleshoot_sharp,
              onClick: () => selectedItem(context, 1)),
          buildMenuItem(
              title: 'Share',
              icon: Icons.share,
              onClick: () => selectedItem(context, 2)),
          const Divider(),
          buildMenuItem(
              title: 'Exit',
              icon: Icons.exit_to_app,
              onClick: () => selectedItem(context, 3)),
        ],
      ),
    );
  }

  Widget buildMenuItem(
      {required String title, required IconData icon, VoidCallback? onClick}) {
    const color = Colors.black87;
    // final hoverColor = Colors.grey[500];

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: const TextStyle(color: color),
      ),
      onTap: onClick,
    );
  }

  void selectedItem(BuildContext myContext, int index) {
    // to close the sidebar each time we clicked on some item .
    Navigator.of(myContext).pop();
    switch (index) {
      case 0:
        Navigator.pushReplacement(myContext,
            MaterialPageRoute(builder: (myContext) => const HomePage()));
        break;
      case 1:
        Navigator.push(myContext,
            MaterialPageRoute(builder: (myContext) => const TestPage()));
        break;
      case 2:
        // Navigator.pushReplacement(myContext, MaterialPageRoute(builder: (myContext) => const HomePage()));
        break;
      case 3:
      // this to exit the app
        SystemNavigator.pop();
        break;
    }
  }
}
