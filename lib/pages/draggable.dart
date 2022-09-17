import 'package:flutter/material.dart';

class DraggableWight extends StatefulWidget {
  final Offset offset;
  final Color wightColor;

  const DraggableWight(
      {Key? key, required this.offset, required this.wightColor})
      : super(key: key);

  @override
  State<DraggableWight> createState() => _DraggableWightState();
}

class _DraggableWightState extends State<DraggableWight> {
  Offset offset = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
          data: widget.wightColor,
          feedback: Container(
            width: 130.0,
            height: 130.0,
            color: widget.wightColor.withOpacity(0.5),
          ),
          onDraggableCanceled: (Velocity velocity, Offset offset) {
            setState(() {
              this.offset = offset;
            });
          },
          child: Container(
            width: 120.0,
            height: 120.0,
            color: widget.wightColor,
          )),
    );
  }
}

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({super.key});

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _draggableColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const DraggableWight(
              offset: Offset(80.0, 80.0), wightColor: Colors.blue),
          const DraggableWight(
              offset: Offset(210.0, 80.0), wightColor: Colors.yellow),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                _draggableColor = color;
              },
              builder: (context, condidateData, refectedData) {
                return Container(
                  width: 250.0,
                  height: 250.0,
                  color: _draggableColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
