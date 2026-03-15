import 'package:flutter/material.dart';

class GameOverOverlay extends StatelessWidget {

  final VoidCallback onExit;

  const GameOverOverlay({super.key, required this.onExit});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.black87,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text(
              "GAME OVER",
              style: TextStyle(
                fontSize: 32,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: onExit,
              child: const Text("Volver al menú"),
            )
          ],
        ),
      ),
    );
  }
}
