import 'package:flutter/material.dart';
import '../util/logger.dart';


typedef OnTransform = void Function(String);

class EmoticonSticker extends StatefulWidget {
    // *Not States.
    final OnTransform onTransform;
    final String imgPath;
    final bool isSelected;


    EmoticonSticker({
        super.key,
      
        required this.onTransform,
        required this.imgPath,
        required this.isSelected,
    }) {
        console('EmoticonSticker(key: $key, imgPath: $imgPath, isSelected: $isSelected) invoked.');
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

          // Apply transform of translate by X,Y and scale.
          return Transform(
              transform:
                    Matrix4.identity()
                        ..translate(hTranslate, vTranslate)
                        ..scale(actualScale),

              child: Container(
                  decoration:
                      widget.isSelected?
                          BoxDecoration( border: Border.all(color: Colors.lightBlueAccent, width: 2.5, style: BorderStyle.solid) )   :
                          BoxDecoration( border: Border.all(color: Colors.transparent, width: 1.0) ),

                  child: GestureDetector(
                      onTap: () { // Type: void Function()?
                          console("onTap(${ (widget.key as ValueKey<String>).value }) invoked.");

                          widget.onTransform( (widget.key as ValueKey<String>).value );
                      },

                      onScaleUpdate: (ScaleUpdateDetails details) { // Type: void Function(ScaleUpdateDetails)?
                          console('onScaleUpdate(details: $details) invoked.');

                          // Update scale and/or transform of the selected emoticon sticker.
                          setState(() {
                              scale = details.scale * actualScale;
                              hTranslate += details.focalPointDelta.dx;
                              vTranslate += details.focalPointDelta.dy;
                          });

                          widget.onTransform( (widget.key as ValueKey<String>).value );
                      },

                      onScaleEnd: (ScaleEndDetails details) { // Type: void Function(ScaleEndDetails)?
                          console('onScaleEnd(details: $details) invoked.');

                          actualScale = scale;
                      },

                      child: Image.asset(widget.imgPath), // Type: Widget?
                  ),
              ),
          );
      }
}


