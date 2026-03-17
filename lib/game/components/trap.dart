import 'package:acelerometro_game/game/utils/sprite_loader.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';


class Trap extends SpriteAnimationComponent with HasGameRef<FlameGame> {

  Trap(Vector2 position)
      : super(
          position: position,
          size: Vector2(64, 64),
        );

  @override
  Future<void> onLoad() async {
    animation = await loadSpriteAnimation(
      game: gameRef,
      imagePath: "Idle-Sheet.png",
      columns: 4,
      rows: 1,
      stepTime: 0.1,
      startRow: 0, // 👈 primera fila
    );
  }
}



