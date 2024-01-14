// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:koe_navigate/Data/Provider.dart';
import 'package:koe_navigate/Screen/Select/level.dart';
import 'package:koe_navigate/Screen/Search/current.dart';
import 'package:koe_navigate/widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeBar(
          height: MediaQuery.of(context).size.height * 0.12,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Choose your current location.',
                  style: basicText(),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/KOE.png',
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 280,
                        left: 60,
                        child: BuildingButton(
                          buildingName: 'E0',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Level(building: buildings[0])),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 140,
                        left: 60,
                        child: BuildingButton(
                          buildingName: 'E1',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Level(building: buildings[1])),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 38,
                        left: 60,
                        child: BuildingButton(
                          buildingName: 'E2',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Level(building: buildings[2])),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 160,
                        child: BuildingButton(
                          buildingName: 'E3',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Level(building: buildings[2])),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 188,
                        left: 210,
                        child: BuildingButton(
                          buildingName: 'E4',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Level(building: buildings[3])),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 350,
                        left: 190,
                        child: BuildingButton(
                          buildingName: 'E5',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Level(building: buildings[4])),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 178,
                        left: 143,
                        child: BuildingButton(
                          buildingName: 'E6',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Level(building: buildings[5])),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const currentLocation()),
                            );
                  },
                  child: const Text('Search for Location'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class BuildingButton extends StatelessWidget {
  final String buildingName;
  final VoidCallback onPressed;

  const BuildingButton({
    Key? key,
    required this.buildingName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          buildingName,
          style: basicText(),
        ),
      ),
    );
  }
}