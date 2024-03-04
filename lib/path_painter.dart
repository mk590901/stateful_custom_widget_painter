import 'package:flutter/material.dart';
import 'store_wrapper.dart';
import 'circular_buffer.dart';
import 'graph_mode.dart';

class PathPainter extends CustomPainter {
  int counter;

  final StoreWrapper _storeWrapper;

  late CircularBuffer<int>
    buffer;

  final paintCircle = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;

  static const markerRadius = 6.0;

//  For graph ......................................................

  Paint paint_ = Paint()
    ..color = Colors.blue
    ..strokeWidth = 2.0
    ..style = PaintingStyle.fill;

  Paint paintPrev = Paint()
    ..color = Colors.blueGrey
    ..strokeWidth = 2.0
    ..style = PaintingStyle.fill;

  Paint paintLine = Paint()
    ..color = Colors.white
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  Paint paintLineAfter = Paint()
    ..color = Colors.white38
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  Paint paintMarker = Paint()
    ..color = Colors.blueGrey
    ..strokeWidth = 16.0
    ..style = PaintingStyle.stroke;

//  ................................................................

  PathPainter.graph(this.counter, this._storeWrapper) {
    buffer = _storeWrapper.buffer();
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawGraph(size, canvas);
  }

  void drawGraph(Size size, Canvas canvas) {

    // Draw a background rectangle
    double shiftH  = size.height/6;
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint_);

    if (counter == 0) {
      return;
    }
  //  Prepare data for drawing  
    _storeWrapper.prepareDrawing(size, shiftH);
  //  Draw on canvas  
    drawProcedure(size, canvas);
  }

  void drawProcedure(Size size, Canvas canvas) {
    if (_storeWrapper.mode() == GraphMode.overlay) {
      drawOverlayGraph(canvas, size);
    }
    else {
      drawFlowingGraph(canvas);
    }
  }

  void drawFlowingGraph(Canvas canvas) {
    canvas.drawPath(_storeWrapper.pathBefore, paintLine);
    canvas.drawPath(_storeWrapper.pathAfter, paintLine);
    if (!_storeWrapper.isFull()) {
      canvas.drawCircle(_storeWrapper.point, markerRadius, paintCircle);
    }
  }

  void drawOverlayGraph(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromLTRB(_storeWrapper.point.dx, 0, size.width, size.height), paintPrev);
    canvas.drawPath(_storeWrapper.pathBefore, paintLine);
    canvas.drawPath(_storeWrapper.pathAfter, paintLineAfter);
    canvas.drawCircle(_storeWrapper.point, markerRadius, paintCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // todo - determine if the path has changed
  }


}
