import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MySlideAnimation extends StatefulWidget {
  const MySlideAnimation({super.key});

  @override
  State<MySlideAnimation> createState() => _MySlideAnimationState();
}

class _MySlideAnimationState extends State<MySlideAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _myAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _myAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(2.0,2.0))
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.elasticIn));

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
          child: SlideTransition(position: _myAnimation!,child: Image(
            width: 150,
            height: 150,
            image: AssetImage("assets/images/nemnig.jpg")),)),
    );
  }
}
