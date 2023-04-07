import 'package:flutter/material.dart';
import 'package:myanimation/bouncing_animation.dart';
import 'package:myanimation/fade_animation.dart';
import 'package:myanimation/puls_animation.dart';
import 'package:myanimation/slide_animation.dart';

import 'flip_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:FlipAnimation(),
    );
  }
}
