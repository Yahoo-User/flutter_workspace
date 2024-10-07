import 'package:flutter/material.dart';
import '../util/logger.dart';


class EmoticonSticker extends StatefulWidget {
    // *Not States.
    final VoidCallback onTransform;   // Type: void Function(ScaleEndDetails)?
    final String imgPath;
    final bool isSelected;


    EmoticonSticker({
      super.key,

      required this.onTransform,
      required this.imgPath,
      required this.isSelected,
    }) {
      console('EmoticonSticker(key: ${key.hashCode}, imgPath: $imgPath, isSelected: $isSelected) invoked.');
    }

    @override
    State<EmoticonSticker> createState() => _EmoticonStackerState();
}


class _EmoticonStackerState extends State<EmoticonSticker> {

      @override
      Widget build(BuildContext context) {
          console('build(context: $context) invoked.');

          return GestureDetector(
              onTap: () { // Type: void Function()?
                  console("GestureDetector::onTap() invoked.");
                  widget.onTransform();
              },

              onScaleUpdate: (ScaleUpdateDetails details) { // Type: void Function(ScaleUpdateDetails)?
                  console('GestureDetector::onScaleUpdate(details: $details) invoked.');
                  widget.onTransform();
              },

              onScaleEnd: (ScaleEndDetails details) { // Type: void Function(ScaleEndDetails)?
                  console('GestureDetector::onScaleEnd(details: $details) invoked.');
              },

              child: Image.asset(widget.imgPath), // Type: Widget?
          );
      }
}


