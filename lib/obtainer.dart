import 'dart:async';
import 'package:flutter/material.dart';

import 'custom_widget.dart';
import 'main.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'drawing_bloc.dart';
// import 'events/draw_events.dart';
// import 'events/event.dart';
// import 'interfaces/i_counter_updater.dart';
// import 'pair_data_object.dart';

class Obtainer {

  final Duration _period;
  late int _cycles;

  late GraphWidgetState _state;

  late Timer timer;
  int _counter = 1; //  Ok

  Obtainer (this._period);

  void setState(int cycles, GraphWidgetState state) {
    _cycles = cycles;
    _state = state;
  }

   void start() {
    print ('------- Obtainer.start -------');

     timer = Timer.periodic(_period, (Timer t) {
       _callbackFunction();
    });

  }

  void redraw(int counter) {
    _state.update(counter);
  }

  void _callbackFunction() {
    redraw(_counter++);
    if (_counter >= _cycles) {
      _counter = 1;
    }
  }

  void stop() {

    print ('------- Obtainer.stop -------');

    if (timer.isActive) {
      timer.cancel();
    }
     print ('------- Obtainer.stop -------');

  }

}
