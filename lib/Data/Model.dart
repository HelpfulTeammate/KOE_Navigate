// ignore_for_file: file_names

class BuildingModel {
  final String name;
  final int noOfLevels;
  final List<FloorModel> floors;

  BuildingModel({
    required this.name,
    required this.noOfLevels,
    required this.floors,
  });
}

class FloorModel {
  final String name;
  final String imageAsset;
  final List<Point<int>> coordinates;

  FloorModel({
    required this.name,
    required this.imageAsset,
    required this.coordinates,
  });
}

class NodeModel {
  final String nodeName;
  final String nodeBlock;
  final String nodeFloor;
  String nodeType;
  final List<Point<int>> coordinates;

  NodeModel({
    required this.nodeName,
    required this.nodeBlock,
    required this.nodeFloor,
    this.nodeType = "location",
    required this.coordinates,
  });
}

class Point<T> {
  final T x;
  final T y;

  Point({required this.x, required this.y});
}