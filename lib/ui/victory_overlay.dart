import 'package:flutter/material.dart';

class VictoryOverlay extends StatelessWidget {

  final VoidCallback onRestart;

  const VictoryOverlay({super.key, required this.onRestart});

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
              "¡GANASTE!",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: onRestart,
              child: const Text("Volver al menú"),
            )

          ],
        ),
      ),
    );
  }
}
