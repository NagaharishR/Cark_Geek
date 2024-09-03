import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/drawer_content.dart';
import '../widgets/packages.dart';
import '../widgets/your_current_bookings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AdvancedDrawerController _drawerController = AdvancedDrawerController();
  int _currentIndex = 0;

  void _onBottomNavTap(int index) {
    if (index == 3) {
      _drawerController.toggleDrawer();
    } else if (index != 0) {
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _drawerController,
      backdropColor: Colors.white,
      openRatio: 0.6,
      animationDuration: Duration(milliseconds: 550),
      animationCurve: Curves.easeInOut,
      disabledGestures: true,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      drawer: DrawerContent(drawerController: _drawerController),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icons/menu_icon.png',
                      width: 34.0,
                      height: 34.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      _drawerController.toggleDrawer();
                    },
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Emily Cyrus',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 170,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nanny And \nBabysitting Services',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            child: Text('Book Now'),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.tertiary,
                              onPrimary: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -26,
                      top: -30,
                      child: Image.asset(
                        'assets/images/image1.png',
                        height: 230,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text(
                      'Your Current Booking',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                YourCurrentBookings(drawerController: _drawerController),
                SizedBox(height: 12.0),
                Row(
                  children: [
                    Text(
                      'Packages',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Packages(drawerController: _drawerController),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onBottomNavTap,
        ),
      ),
    );
  }
}
