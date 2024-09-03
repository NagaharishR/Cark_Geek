import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.home),
              if (currentIndex == 0)
                Positioned(
                  bottom: -24,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.discount_outlined),
          label: 'Packages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_3_outlined),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        if (index == 3) {
          onTap(index);
        } else if (index != 0) {

        } else {
          onTap(index);
        }
      },
    );
  }
}
