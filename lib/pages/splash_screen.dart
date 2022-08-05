import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/custom_bottom.dart';
import 'dart:ui';

class SplashScreenDemo extends StatefulWidget {
  const SplashScreenDemo({super.key});

  @override
  State<SplashScreenDemo> createState() => _SplashScreenDemoState();
}

class _SplashScreenDemoState extends State<SplashScreenDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const CustomBottomPage(title: 'Hello')),
            (route) => false);
      }
    });

    _controller.forward(); // 播放动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Image.network('http://pic1.win4000.com/pic/d/67/e9ca2834b3.jpg',
          width: window.physicalSize.width,
          height: window.physicalSize.height,
          fit: BoxFit.cover),
    );
  }
}
