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

Future<SpriteAnimation> loadVerticalAnimation({
  required FlameGame game,
  required String imagePath,
  required int columns,
  required int rows,
  required double stepTime,
  int startColumn = 0,
  int startRow = 0, // Añadido por flexibilidad
  int? frameCount,  // Cambiado a opcional para mejor manejo
}) async {
  final image = await game.images.load(imagePath);
  final frameSize = Vector2(image.width / columns, image.height / rows);

  return SpriteAnimation.fromFrameData(
  image,
  SpriteAnimationData.sequenced(
    amount: columns, // total de frames en la fila (8)
    stepTime: stepTime,
    textureSize: frameSize,
    texturePosition: Vector2(
      startColumn * frameSize.x,
      startRow * frameSize.y, // ✅ corregido
    ),
    amountPerRow: columns, // ✅ debe coincidir con la fila
  ),
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

Future<SpriteAnimationComponent> createAnimatedSpriteVertiacal({
  required FlameGame game,
  required String imagePath,
  required int columns,
  required int rows,
  required Vector2 position,
  required Vector2 size,
  double stepTime = 0.205,
}) async {

  final animation = await loadVerticalAnimation(
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