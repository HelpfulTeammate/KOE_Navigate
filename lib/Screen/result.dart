// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:koe_navigate/Data/Model.dart';
import 'package:koe_navigate/Data/djikstra.dart';
import 'package:koe_navigate/Data/graph.dart';
import 'package:koe_navigate/Data/nodeList.dart';
import 'package:koe_navigate/widget.dart';

class Result extends StatefulWidget {
  final String currentLocation;
  final String destinationLocation;

  const Result({Key? key, required this.currentLocation, required this.destinationLocation})
      : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  List<dynamic> shortestPath = [];
  int shortestPathCost = 0;

  @override
  void initState() {
    super.initState();
    runDjikstraAlgorithm();
  }
  void runDjikstraAlgorithm() {
    shortestPath = Dijkstra.findPath(graph, widget.currentLocation, widget.destinationLocation);
    shortestPathCost = Dijkstra.findCost(graph, widget.currentLocation, widget.destinationLocation);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar(
          height: MediaQuery.of(context).size.height * 0.12,
          subName: "Path to ${widget.destinationLocation}",
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Column(
                  children: buildFloorImages(),
                ),
                ElevatedButton(
                  onPressed: () {
                    popUpDialog(context,
                        "Navigation Results",
                        "Start Location: ${widget.currentLocation}\nDestination Location: ${widget.destinationLocation}\n\nShortest Path: ${shortestPath.join(' -> ')}\nShortest Cost: ${shortestPathCost}m");
                  },
                  child: const Text('Result Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildFloorImages() {
    List<Widget> widgets = [];

    String currentFloor = "";
    List<Widget> currentFloorWidgets = [];

  for (int i = 0; i < shortestPath.length; i++) {
      NodeModel currentNode =
          nodes.firstWhere((node) => node.nodeName == shortestPath[i]);
      if (currentFloor != currentNode.nodeFloor) {
      currentFloorWidgets = [];
      }
      for (int j = i; j < shortestPath.length; j++) {
        NodeModel tempNode =
          nodes.firstWhere((node) => node.nodeName == shortestPath[j]);
        if(tempNode.nodeFloor == currentNode.nodeFloor){
          if(currentFloorWidgets.isEmpty){
            print('first node added ${tempNode.nodeBlock} ${tempNode.nodeName}');
            currentFloorWidgets.add(
            Positioned(
              top: tempNode.coordinates[0].x.toDouble(),
              left: tempNode.coordinates[0].y.toDouble(),
              child: const Text("START", style: TextStyle(fontWeight: FontWeight.w500),),
            ),
          );
          currentFloorWidgets.add(
            Positioned(
              top: 0,
              left: 5,
              child: Text("${tempNode.nodeBlock}.${tempNode.nodeFloor}"),
            ),
          );
          }else{
            print(' node added ${tempNode.nodeBlock} ${tempNode.nodeName}');
            currentFloorWidgets.add(
            Positioned(
              top: tempNode.coordinates[0].x.toDouble()+10,
              left: tempNode.coordinates[0].y.toDouble()+10,
              child: Container(
                width: 5, 
                height: 5,
                color: Colors.black,
              ),
            ),
          );
          }
        }
      }      
      if (currentFloor != currentNode.nodeFloor) {
        widgets.add(Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(getFloorImage(currentNode.nodeFloor), fit: BoxFit.fill,),
                      ...currentFloorWidgets,
                    ],
                  ),
                ));
        currentFloor = currentNode.nodeFloor;
        currentFloorWidgets = [];
      }
    }
    return widgets;
  }


  String getFloorImage(String floor) {
    Map<String, String> floorImages = {
      '1': 'assets/E2.1.png',
      '2': 'assets/E2.2.png',
      '3': 'assets/E2.3.png',
      '4': 'assets/E2.4.png',
    };
    return floorImages[floor] ?? 'assets/E2.1.png';
  }
}