import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BouncingAnimation extends StatefulWidget {
  const BouncingAnimation({super.key});

  @override
  State<BouncingAnimation> createState() => _BouncingAnimationState();
}

class _BouncingAnimationState extends State<BouncingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _myAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _myAnimation = Tween<double>(begin: 30, end: 300).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.bounceOut));

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
        child: const Icon(Icons.play_arrow),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _myAnimation!,
            builder: (context, child) => Container(
              margin: EdgeInsets.only(top: _myAnimation!.value),
              child: const Image(
                width: 100,
                height: 100,
                image: AssetImage("assets/images/nemnig.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
