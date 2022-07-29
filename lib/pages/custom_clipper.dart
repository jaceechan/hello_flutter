import 'package:flutter/material.dart';

class CustomClipperDemo extends StatelessWidget {
  const CustomClipperDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Clipper Demo'),
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: TopClipper(),
            child: Container(color: Colors.amber, height: 200.0),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ClipPath(
                clipper: BottomClipper(),
                child: Container(color: Colors.purple, height: 200.0),
              ))
        ],
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 60);

    var fisrtControlPoint = Offset(size.width / 2, size.height);
    var fisrtEndPoint = Offset(size.width, size.height - 60);

    path.quadraticBezierTo(fisrtControlPoint.dx, fisrtControlPoint.dy,
        fisrtEndPoint.dx, fisrtEndPoint.dy);

    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);

    var fisrtControlPoint = Offset(size.width / 4, size.height);
    var fisrtEndPoint = Offset(size.width / 2.25, size.height - 30);

    path.quadraticBezierTo(fisrtControlPoint.dx, fisrtControlPoint.dy,
        fisrtEndPoint.dx, fisrtEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.75, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
