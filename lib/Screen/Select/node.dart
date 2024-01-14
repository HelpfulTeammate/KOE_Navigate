// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:koe_navigate/Data/Model.dart';
import 'package:koe_navigate/widget.dart';

class Floor extends StatelessWidget {
  final int floor;
  final BuildingModel building;

  const Floor({
    Key? key,
    required this.floor,
    required this.building,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar(
          height: MediaQuery.of(context).size.height * 0.12,
          subName: "Current location: ${building.name}, Level $floor",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Choose node closest to your current location.',
                  style: basicText(),
                ),
                const SizedBox(height: 16),
                Image.asset(
                        building.floors[floor-1].imageAsset,
                        fit: BoxFit.fill,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}