import 'package:acelerometro_game/game/utils/sprite_loader.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';


class Player extends SpriteAnimationComponent with HasGameRef<FlameGame> {

  Player(Vector2 position)
      : super(
          position: position,
          size: Vector2(64, 64),
        );

  @override
  Future<void> onLoad() async {
    animation = await loadSpriteAnimation(
      game: gameRef,
      imagePath: "Slime1_Idle_body.png",
      columns: 6,
      rows: 4,
      stepTime: 0.1,
      startRow: 0, // 👈 primera fila
    );
  }
}