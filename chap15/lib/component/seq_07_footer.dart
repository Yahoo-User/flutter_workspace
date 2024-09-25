import 'package:flutter/material.dart';

import '../util/logger.dart';


/*
 * ======================
 *  (1) List.generate( int length, E generator(int index), [bool growable = true] )
 * ======================
 *  Generates a list of values.
 *  Creates a list with length positions and fills it with values created by
 *  calling generator for each index in the range 0 .. length - 1 in increasing order.
 *
 *  ======================
 *  (2) EdgeInsets.symmetric(horizontal, vertical)
 *  ======================
 *  Creates insets with symmetrical vertical and horizontal offsets.
 *  ex) const EdgeInsets. symmetric(vertical: 8.0)  => Eight pixel margin above and below, no horizontal margins:
 *
 *  ======================
 *  (3) GestureDetector (StatelessWidget)
 *  ======================
 *  Creates a widget that detects gestures.
 *
 *  Pan and scale callbacks cannot be used simultaneously because scale is a superset of pan.
 *  Use the scale callbacks instead.
 *  Horizontal and vertical drag callbacks cannot be used simultaneously
 *  because a combination of a horizontal and vertical drag is a pan.
 *  Use the pan callbacks instead.
 *
 *  By default, gesture detectors contribute semantic information to the tree that is used by assistive technology.
 *
 *  ======================
 *  (4) SingleChildScrollView
 *  ======================
 *  Creates a box in which a single widget can be scrolled.
 *
 */

typedef OnEmoticonTap = void Function(int id);

class Footer extends StatelessWidget {
    final OnEmoticonTap onEmoticonTap;


    const Footer({
        required this.onEmoticonTap,
        super.key,
    });

    @override
    Widget build(BuildContext context) {
        console('build(context: $context) invoked.');

        return Container(
            color: Colors.white.withOpacity(.9),
            height: 100,

            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,   // scroll only for the horizontal direction.

                child: Row(
                    children: List.generate(
                        7,                                  // length : number of all emoticons = 7

                        ( index ) => Padding(     // generator
                            key: Key('Padding-$index') ,
                            padding: const EdgeInsets.symmetric( horizontal: 8.0, vertical: .0 ),

                            child: GestureDetector(
                                onTap: () => onEmoticonTap(index + 1),
                                child: Image.asset( 'assets/img/emoticon_${index + 1}.png', height: 70 ),
                            ),
                        ),

                        growable: true
                    ),
                ),
            ),
        );
    }
}


