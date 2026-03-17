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
      body: Stack(
        children: [
          // 🔹 Fondo con imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back.jpg"), // 👈 tu imagen
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Opcional: overlay oscuro para mejorar visibilidad
          Container(
            color: Colors.black.withOpacity(0.2),
          ),

          // 🔹 Juego encima del fondo
          GameWidget<MyGame>(
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
          ),
        ],
      ),
    );
  }
}