import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends RectangleComponent {

  Player(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          paint: Paint()..color = Colors.green,
        );
}
