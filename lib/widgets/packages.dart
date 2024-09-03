import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:loading_indicator/loading_indicator.dart';

class Packages extends StatefulWidget {
  final AdvancedDrawerController drawerController;

  const Packages({super.key, required this.drawerController});

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  List<Package> packages = [];

  @override
  void initState() {
    super.initState();
    fetchPackageList();
  }

  Future<void> fetchPackageList() async {
    try {
      final response = await http.get(
          Uri.parse('https://www.cgprojects.in/lens8/api/dummy/packages_list'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> packageList = data['response'];
        setState(() {
          packages = packageList.map((item) => Package.fromJson(item)).toList();
        });
      } else {
        throw Exception('Failed to load package list');
      }
    } catch (e) {
      print('Error fetching package list: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (packages.isEmpty) {
      return SizedBox(
        width: 50.0,
        height: 20.0,
        child:LoadingIndicator(
          indicatorType: Indicator.ballPulse,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
            // Add more colors if needed
          ],
          strokeWidth: 10,
          backgroundColor: Colors.white,
          pathBackgroundColor: Theme.of(context).colorScheme.surface,
        )
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final package = packages[index];
              final isEven = index % 2 == 0;
              final imageColor = isEven ? Colors.pink : Colors.white;
              final textColor = imageColor;

              final buttonColor =
                  isEven ? Color(0xFFE36DA6) : Color(0xFF0D7CCC);
              final buttonTextColor = isEven ? Colors.white : Colors.white;

              String? displayText;
              Widget? displayIcon;

              if (package.title.toLowerCase().contains('one day package')) {
                displayText = '1';
              } else if (package.title
                  .toLowerCase()
                  .contains('three day package')) {
                displayText = '3';
              } else if (package.title
                  .toLowerCase()
                  .contains('five day package')) {
                displayText = '5';
              } else {
                displayIcon = Icon(
                  Icons.wb_sunny,
                  color: textColor,
                  size: 14.0,
                );
              }

              return Card(
                color: isEven
                    ? Theme.of(context).colorScheme.primary
                    : Color(0xFF80ABDB),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/time-and-date.png',
                                  color: imageColor,
                                  width: 27.0,
                                  height: 27.0,
                                ),
                                Positioned(
                                  child: Container(
                                    padding: const EdgeInsets.all(7.0),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Center(
                                      child: displayText != null
                                          ? Text(
                                              displayText,
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 12.0,
                                              ),
                                            )
                                          : displayIcon,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                widget.drawerController.toggleDrawer();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: buttonColor,
                                onPrimary: buttonTextColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 18.0),
                                minimumSize: Size(0, 20),
                              ),
                              child: Text(
                                'Book Now',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      color: buttonTextColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                package.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontSize: 15.0,
                                    ),
                              ),
                            ),
                            Text(
                              '₹${package.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 15.0,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          package.description,
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Package {
  final String title;
  final String price;
  final String description;

  Package({
    required this.title,
    required this.price,
    required this.description,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      title: json['title'],
      price: json['price'],
      description: json['desc'],
    );
  }
}
