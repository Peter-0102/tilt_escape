import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'level_data.dart';
import 'components/player.dart';
import 'components/goal.dart';
import 'components/trap.dart';


class MyGame extends FlameGame {

  final int levelIndex;

  MyGame({required this.levelIndex});

  late Player player;
  late Goal goal;

  List<Trap> traps = [];

  double accelX = 0;
  double accelY = 0;

  StreamSubscription? sensorSub;

  bool finished = false;

  // 🔹 Fondo
  SpriteComponent? background;

  @override
  Future<void> onLoad() async {

    // 🔹 Cargar fondo
    final bgSprite = await loadSprite('back.png');

    background = SpriteComponent()
      ..sprite = bgSprite
      ..position = Vector2.zero()
      ..priority = -1; // 👈 MUY IMPORTANTE (al fondo)

    add(background!);


    final level = levels[levelIndex];

    player = Player(level.playerStart);
    goal = Goal(level.goalPosition);

    add(player);
    add(goal);

    for (var pos in level.traps) {
      final trap = Trap(pos);
      traps.add(trap);
      add(trap);
    }

    sensorSub = accelerometerEvents.listen((event) {
      accelX = accelX * 0.8 + event.x * 0.2;
      accelY = accelY * 0.8 + event.y * 0.2;
    });
  }

  // 🔹 Ajustar tamaño del fondo automáticamente
@override
void onGameResize(Vector2 canvasSize) {
  super.onGameResize(canvasSize);

  background?.size = canvasSize; // 👈 seguro
}
  @override
  void update(double dt) {
    super.update(dt);

    if (finished) return;

    player.x -= accelX * 5;
    player.y += accelY * 5;

    _checkBounds();
    _checkGoal();
    _checkTraps();
  }

  void _checkBounds() {

    if (player.x < 0) player.x = 0;
    if (player.y < 0) player.y = 0;

    if (player.x + player.width > size.x) {
      player.x = size.x - player.width;
    }

    if (player.y + player.height > size.y) {
      player.y = size.y - player.height;
    }
  }

  void _checkGoal() {

    if (player.toRect().overlaps(goal.toRect())) {

      finished = true;
      pauseEngine();

      overlays.add("victory");
    }
  }

  void _checkTraps() {

    for (var trap in traps) {

      if (player.toRect().overlaps(trap.toRect())) {

        finished = true;
        pauseEngine();

        overlays.add("gameover");
      }
    }
  }

  @override
  void onRemove() {
    sensorSub?.cancel();
    super.onRemove();
  }
}