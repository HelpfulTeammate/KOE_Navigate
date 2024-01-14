import 'package:flutter/material.dart';
import 'package:koe_navigate/Data/Model.dart';
import 'package:koe_navigate/Data/nodeList.dart';
import 'package:koe_navigate/Screen/result.dart';
// import 'package:koe_navigate/Screen/result%20copy.dart';
import 'package:koe_navigate/widget.dart';

class Destination extends StatefulWidget {
  final String currentLocation;

  const Destination({Key? key, required this.currentLocation}) : super(key: key);

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  List<NodeModel> filteredNodes = [];

  @override
  void initState() {
    super.initState();
    // Assuming nodes is a list of all nodes, replace it with your actual data.
    filteredNodes = nodes;
  }

  void _filterNodes(String query) {
    setState(() {
      filteredNodes = nodes
          .where((node) =>
              node.nodeName.toLowerCase().contains(query.toLowerCase()) ||
              node.nodeBlock.toLowerCase().contains(query.toLowerCase()) ||
              node.nodeFloor.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar(
          height: MediaQuery.of(context).size.height * 0.12,
          subName: "Start location is ${widget.currentLocation}",
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0.1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: TextField(
                onChanged: _filterNodes,
                decoration: const InputDecoration(
                  labelText: 'Search Destination',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: filteredNodes.length,
                padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Result(currentLocation: widget.currentLocation, destinationLocation: filteredNodes[index].nodeName)),
                            );
                    },
                    child: ListTile(
                      title: Text(
                        filteredNodes[index].nodeName,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        'Block: ${filteredNodes[index].nodeBlock}, Floor: ${filteredNodes[index].nodeFloor}',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}