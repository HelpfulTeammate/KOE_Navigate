// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:koe_navigate/Data/Model.dart';
import 'package:koe_navigate/Screen/Select/node.dart';
import 'package:koe_navigate/widget.dart';

class Level extends StatelessWidget {
  final BuildingModel building;

  const Level({
    Key? key,
    required this.building,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar(
          height: MediaQuery.of(context).size.height * 0.12,
          subName: "Current location: ${building.name}",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Which level are you on?',
                  style: basicText(),
                ),
                const SizedBox(height: 16),
                for (int i = building.noOfLevels; i >= 1; i--)
                  ElevatedButton(
                    onPressed: () {
                      print('Level $i selected');
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Floor(building: building, floor: i)),
                            );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('Level $i'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}