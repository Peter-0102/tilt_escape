import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Trap extends RectangleComponent {

  Trap(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          paint: Paint()..color = Colors.red,
        );
}
