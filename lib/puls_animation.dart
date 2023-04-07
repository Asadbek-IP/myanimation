import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PulsAnimation extends StatefulWidget {
  const PulsAnimation({super.key});

  @override
  State<PulsAnimation> createState() => _PulsAnimationState();
}

class _PulsAnimationState extends State<PulsAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Size>? _myAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _myAnimation = Tween<Size>(begin: Size(100, 100), end: Size(200, 200))
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.bounceIn));

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController!.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController!.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: _myAnimation!,
        builder: (context, child) => Image(
            width: _myAnimation!.value.width,
            height: _myAnimation!.value.height,
            image: AssetImage("assets/images/nemnig.jpg")),
      )),
    );
  }
}
