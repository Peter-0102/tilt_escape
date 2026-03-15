import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Goal extends RectangleComponent {

  Goal(Vector2 position)
      : super(
          position: position,
          size: Vector2(50, 50),
          paint: Paint()..color = Colors.blue,
        );
}
