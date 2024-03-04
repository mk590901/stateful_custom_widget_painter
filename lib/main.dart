import 'package:flutter/material.dart';
import 'custom_widget.dart';
import 'graph_mode.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar:
      AppBar(
        title: const Text("Flutter ECG drawer", style: TextStyle(color: Colors.white, fontSize: 12)),
        leading: IconButton(
          icon: const Icon(Icons.graphic_eq_sharp, color: Colors.white), // Icon widget
          onPressed: () {
          },
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              GraphWidget(
                width: 320,
                height: 120,
                seriesBuffer: 128,
		mode:       GraphMode.overlay
              ),
              SizedBox(height: 16.0),
              GraphWidget(
                width: 320,
                height: 120,
                seriesBuffer: 200,
		mode:       GraphMode.flowing
              ),
              SizedBox(height: 16.0),
              GraphWidget(
                width: 320,
                height: 120,
                seriesBuffer: 300,
		mode:       GraphMode.overlay
              ),
              SizedBox(height: 16.0),
              GraphWidget(
                width: 320,
                height: 120,
                seriesBuffer: 250,
		mode:       GraphMode.flowing
              ),
              SizedBox(height: 16.0),
              GraphWidget(
                width: 320,
                height: 120,
                seriesBuffer: 300,
		mode:       GraphMode.overlay
              ),
              SizedBox(height: 16.0),
              GraphWidget(
                width: 320,
                height: 120,
                seriesBuffer: 128,
		mode:       GraphMode.flowing
              ),
              SizedBox(height: 16.0),
              GraphWidget(
                width: 320,
                height: 120,
                seriesBuffer: 256,
		mode:       GraphMode.overlay
              ),
              SizedBox(height: 16.0),
              GraphWidget(
                width: 320,
                height: 120,
                seriesBuffer: 128,
		mode:       GraphMode.flowing
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    ),
  ));
}
