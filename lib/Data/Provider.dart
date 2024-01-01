// ignore_for_file: file_names, non_constant_identifier_names
import 'package:koe_navigate/Data/Model.dart';

final List<BuildingModel> buildings = [
  BuildingModel(
      name: 'E0', 
      noOfLevels: 3, 
      floors: E0,
),
  BuildingModel(
      name: 'E1', 
      noOfLevels: 5, 
      floors: E1,
),
  BuildingModel(
      name: 'E2 & E3', 
      noOfLevels: 4, 
      floors: E2,
),
  BuildingModel(
      name: 'E4', 
      noOfLevels:4, 
      floors: E4,
),
  BuildingModel(
      name: 'E5', 
      noOfLevels: 4, 
      floors: E5,
),  
  BuildingModel(
      name: 'E6', 
      noOfLevels: 2, 
      floors: E6,
),
];

final List<FloorModel> E0 = [
  FloorModel(
      name: 'Level 1', 
      imageAsset: "assets/E0.1.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 2', 
      imageAsset: "assets/E0.2.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 3', 
      imageAsset: "assets/E0.3.png", 
      coordinates: [],
)
];

final List<FloorModel> E1 = [
  FloorModel(
      name: 'Level 1', 
      imageAsset: "assets/E1.1.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 2', 
      imageAsset: "assets/E1.2.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 3', 
      imageAsset: "assets/E1.3.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 4', 
      imageAsset: "assets/E1.4.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 5', 
      imageAsset: "assets/E1.5.png", 
      coordinates: [],
),
];

final List<FloorModel> E2 = [
  FloorModel(
      name: 'Level 1', 
      imageAsset: "assets/E2.1.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 2', 
      imageAsset: "assets/E2.2.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 3', 
      imageAsset: "assets/E2.3.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 4', 
      imageAsset: "assets/E2.4.png", 
      coordinates: [],
),
];

final List<FloorModel> E4 = [
  FloorModel(
      name: 'Level 1', 
      imageAsset: "assets/E4.1.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 2', 
      imageAsset: "assets/E4.2.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 3', 
      imageAsset: "assets/E4.3.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 4', 
      imageAsset: "assets/E4.4.png", 
      coordinates: [],
),
];

final List<FloorModel> E5 = [
  FloorModel(
      name: 'Level 1', 
      imageAsset: "assets/E5.1.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 2', 
      imageAsset: "assets/E5.2.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 3', 
      imageAsset: "assets/E5.3.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 4', 
      imageAsset: "assets/E5.4.png", 
      coordinates: [],
),
];

final List<FloorModel> E6 = [
  FloorModel(
      name: 'Level 1', 
      imageAsset: "assets/E6.1.png", 
      coordinates: [],
),
  FloorModel(
      name: 'Level 2', 
      imageAsset: "assets/E6.2.png", 
      coordinates: [],
)
];