class LevelModel {
  int levelNo;
  String description;

  LevelModel({required this.levelNo, required this.description});
}

List<LevelModel> levelsList = [
  LevelModel(
    levelNo: 1,
    description: "Use less than 100l in one shower session",
  ),
  LevelModel(
    levelNo: 2,
    description: "Use less than 100l in two consecutive shower sessions",
  ),
  LevelModel(
    levelNo: 3,
    description: "Use less than your floor's daily average in one shower session",
  ),
  LevelModel(
    levelNo: 4,
    description: "Use less than 80l in one shower session",
  ),
  LevelModel(
    levelNo: 5,
    description: "Use less than 90l in three consecutive shower sessions",
  ),
  LevelModel(
    levelNo: 6,
    description: "Use less than your daily average in one shower session",
  ),
  LevelModel(
    levelNo: 7,
    description: "Use less than 70l in one shower session",
  ),
  LevelModel(
    levelNo: 8,
    description: "Use less than 70l in two consecutive shower sessions",
  ),
  LevelModel(
    levelNo: 9,
    description: "Use less than the university's daily average in two consecutive shower sessions",
  ),
  LevelModel(
    levelNo: 10,
    description: "Use less than 50l in one shower session",
  ),
];
