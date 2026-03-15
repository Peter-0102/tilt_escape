import 'package:flame/components.dart';

class LevelData {

  final Vector2 playerStart;
  final Vector2 goalPosition;
  final List<Vector2> traps;

  LevelData({
    required this.playerStart,
    required this.goalPosition,
    required this.traps,
  });
}

final levels = [

  LevelData(
    playerStart: Vector2(50, 50),
    goalPosition: Vector2(300, 500),
    traps: [
      Vector2(150, 200),
      Vector2(200, 300),
      Vector2(100, 400),
    ],
  ),

  LevelData(
    playerStart: Vector2(80, 80),
    goalPosition: Vector2(320, 520),
    traps: [
      Vector2(150, 150),
      Vector2(250, 250),
      Vector2(200, 420),
      Vector2(100, 350),
    ],
  )

];
