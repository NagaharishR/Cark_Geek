import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class DrawerContent extends StatelessWidget {
  final AdvancedDrawerController drawerController;

  DrawerContent({required this.drawerController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 42.0,
                    backgroundImage: AssetImage(
                      'assets/images/profile.png',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Emily Cyrus',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 38.0),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                    drawerController.hideDrawer();
                  },
                ),
                Divider(height: 1.0, thickness: 1.0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Book A Nanny',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/book_nanny');
                    drawerController.hideDrawer();
                  },
                ),
                Divider(height: 1.0, thickness: 1.0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'How It Works',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/how_it_works');
                    drawerController.hideDrawer();
                  },
                ),
                Divider(height: 1.0, thickness: 1.0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Why Nanny Vanny',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/why_nanny_vanny');
                    drawerController.hideDrawer();
                  },
                ),
                Divider(height: 1.0, thickness: 1.0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'My Bookings',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/my_bookings');
                    drawerController.hideDrawer();
                  },
                ),
                Divider(height: 1.0, thickness: 1.0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'My Profile',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/my_profile');
                    drawerController.hideDrawer();
                  },
                ),
                Divider(height: 1.0, thickness: 1.0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Support',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/support');
                    drawerController.hideDrawer();
                  },
                ),
                Divider(height: 1.0, thickness: 1.0),
                // Add more items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}