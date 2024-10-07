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
      // Declare states.
      double scale = 1.0;
      double actualScale = 1.0;

      double hTranslate = 0;
      double vTranslate = 0;


      @override
      Widget build(BuildContext context) {
          console('build(context: $context) invoked.');

          return Container(
              decoration:
                  widget.isSelected?
                      BoxDecoration( border: Border.all(color: Colors.blue, width: 1.0) )   :
                      BoxDecoration( border: Border.all(color: Colors.transparent, width: 1.0) ),

              child: GestureDetector(
                  onTap: () { // Type: void Function()?
                      console("onTap() invoked.");
                      widget.onTransform();
                  },

                  onScaleUpdate: (ScaleUpdateDetails details) { // Type: void Function(ScaleUpdateDetails)?
                      console('onScaleUpdate(details: $details) invoked.');
                      widget.onTransform();

                      // Update scale and/or transform of the selected emoticon sticker.
                      setState(() {
                          scale = details.scale * actualScale;

                          hTranslate += details.focalPointDelta.dx;
                          vTranslate += details.focalPointDelta.dy;

                          console('  + scale: $scale, hTranslate: $hTranslate, vTransform: $vTranslate');
                    });
                  },

                  onScaleEnd: (ScaleEndDetails details) { // Type: void Function(ScaleEndDetails)?
                      console('onScaleEnd(details: $details) invoked.');

                      actualScale = scale;
                      console('  + scale: $scale, actualScale: $actualScale, hTranslate: $hTranslate, vTranslate: $vTranslate');
                  },

                  child: Image.asset( widget.imgPath ), // Type: Widget?
              ),
          );
      }
}


