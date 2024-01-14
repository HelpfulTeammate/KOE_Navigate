// ignore_for_file: avoid_print, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:koe_navigate/widget.dart';

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

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
                        'assets/E2.1.png',
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 15,
                        left: 95,
                        child: Icon(Icons.near_me_outlined),
                      ),
                    ],
                  ),
                )
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
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(1000),
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