import 'package:flutter/material.dart';
import 'game_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Fondo con imagen (puedes cambiarla)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back.png"), 
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Overlay oscuro para mejor contraste
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // 🔹 Contenido principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Seleccionar Nivel",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 40),

                _buildLevelButton(
                  context,
                  text: "Nivel 1",
                  level: 0,
                  colors: [const Color.fromARGB(255, 194, 124, 33), Colors.cyan],
                ),

                const SizedBox(height: 20),

                _buildLevelButton(
                  context,
                  text: "Nivel 2",
                  level: 1,
                  colors: [Colors.purple, const Color.fromARGB(255, 12, 128, 206)],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelButton(
    BuildContext context, {
    required String text,
    required int level,
    required List<Color> colors,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GameScreen(level: level),
          ),
        );
      },
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.6),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}