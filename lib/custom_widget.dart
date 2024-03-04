import 'package:flutter/material.dart';
import 'obtainer.dart';
import 'path_painter.dart';
import 'store_wrapper.dart';
import 'graph_mode.dart';

class GraphWidget extends StatefulWidget {

  final double width;
  final double height;
  final GraphMode mode;
  final int seriesBuffer;

  const GraphWidget({super.key, required this.width, required this.height, required this.seriesBuffer, required this.mode});

  @override
  GraphWidgetState createState() => GraphWidgetState();
}

class GraphWidgetState extends State<GraphWidget> {

  bool _startStop = false;

  late  int currentCounter = 0;
  late  StoreWrapper storeWrapper = StoreWrapper(widget.seriesBuffer, 5, widget.mode);

  final Obtainer
    obtain = Obtainer(const Duration(milliseconds: 24));

  void update(int counter) {
    setState(() {
      currentCounter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {

    storeWrapper.updateBuffer(currentCounter);

    obtain.setState(storeWrapper.drawingFrequency(), this);

    return GestureDetector(
       onTap: () {
        // Handle tap event
        _startStop = !_startStop;
        if (_startStop) {
          obtain.start();
        }
        else {
          obtain.stop();
        }
      },
      child: CustomPaint(
        // Use your CustomPainter here
        painter: PathPainter.graph(currentCounter, storeWrapper),
        child: SizedBox(
          // Container for size
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}
