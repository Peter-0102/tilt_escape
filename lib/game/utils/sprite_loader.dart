import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

Future<SpriteAnimation> loadSpriteAnimation({
  required FlameGame game,
  required String imagePath,
  required int columns,
  required int rows,
  required double stepTime,
  int startRow = 0,
  int frameCount = 0,
}) async {

  final image = await game.images.load(imagePath);

  final frameWidth = image.width / columns;
  final frameHeight = image.height / rows;

  final spriteSheet = SpriteSheet(
    image: image,
    srcSize: Vector2(frameWidth, frameHeight),
  );

  return spriteSheet.createAnimation(
    row: startRow,
    stepTime: stepTime,
    to: frameCount == 0 ? columns : frameCount,
  );
}


Future<SpriteAnimationComponent> createAnimatedSprite({
  required FlameGame game,
  required String imagePath,
  required int columns,
  required int rows,
  required Vector2 position,
  required Vector2 size,
  double stepTime = 0.1,
}) async {

  final animation = await loadSpriteAnimation(
    game: game,
    imagePath: imagePath,
    columns: columns,
    rows: rows,
    stepTime: stepTime,
  );

  return SpriteAnimationComponent(
    animation: animation,
    position: position,
    size: size,
  );
}