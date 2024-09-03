import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class YourCurrentBookings extends StatefulWidget {
  final AdvancedDrawerController drawerController;

  const YourCurrentBookings(
      {super.key, required this.drawerController});

  @override
  State<YourCurrentBookings> createState() => _YourCurrentBookingsState();
}

class _YourCurrentBookingsState extends State<YourCurrentBookings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'One Day Package',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  widget.drawerController.toggleDrawer();
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                  onPrimary: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                  minimumSize: Size(0, 20),
                ),
                child: Text(
                  'Start',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
          SizedBox(height: 7.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('From', style: Theme.of(context).textTheme.caption),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/time-and-date.png',
                        width: 25.0,
                        height: 25.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '12.08.2020',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Theme.of(context).colorScheme.primary,
                        size: 25.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '11 pm',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('To', style: Theme.of(context).textTheme.caption),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/time-and-date.png',
                        width: 25.0,
                        height: 25.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '13.08.2020',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Theme.of(context).colorScheme.primary,
                        size: 25.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '07 am',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 1),
            ],
          ),
          SizedBox(height: 7.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.star_border, size: 10.0),
                label: Text('Rate Us'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.tertiary,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  textStyle: TextStyle(fontSize: 12.0),
                  minimumSize: Size(0, 5),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.location_on_outlined, size: 10.0),
                label: Text('Geolocation'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.tertiary,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  textStyle: TextStyle(fontSize: 12.0),
                  minimumSize: Size(0, 5),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  widget.drawerController.toggleDrawer();
                },
                icon: Icon(Icons.mic, size: 10.0),
                label: Text('Surveillance'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.tertiary,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  textStyle: TextStyle(fontSize: 12.0),
                  minimumSize: Size(0, 5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
