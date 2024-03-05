# Flutter ECG Drawer

This project is a modification of the project https://github.com/mk590901/custom_widget_painter.

## Introduction

The widget described earlier has been significantly simplified while maintaining functionality and improving scalability. Migration from stateless to stateful model has been done.

## Refactoring

The project has been refactored. Two rendering modes have been introduced: _overlap_ and _flowing_. The first corresponds to drawing an overlay of a new image on the old one, the second to adding new points to the old ones and creating the effect of a “driving” trend. The mode is added to the constructor of widget.

## Movie

https://github.com/mk590901/stateful_custom_widget_painter/assets/125393245/a1ec996d-b4d7-4129-b45a-a81a528aac13


