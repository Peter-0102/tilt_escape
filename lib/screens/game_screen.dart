import 'package:acelerometro_game/ui/game_over_overlay.dart';
import 'package:acelerometro_game/ui/victory_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/my_game.dart';


class GameScreen extends StatelessWidget {
  final int level;
  const GameScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {

    final game = MyGame(levelIndex: level);

    return Scaffold(
body: GameWidget<MyGame>(
  game: game,
  overlayBuilderMap: {

    'victory': (context, game) {
      return VictoryOverlay(
        onRestart: () => Navigator.pop(context),
      );
    },

    'gameover': (context, game) {
      return GameOverOverlay(
        onExit: () => Navigator.pop(context),
      );
    },

  },
)
,
    );
  }
}
