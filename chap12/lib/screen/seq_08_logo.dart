import 'package:flutter/material.dart';
import '../util/logger.dart';


class Logo extends StatelessWidget {
    // GestureTapCallback: Signature for when a tap has occurred.
    //      typedef GestureTapCallback = void Function();
    final GestureTapCallback onNewVideoSelect;


    const Logo({ required this.onNewVideoSelect, super.key });

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        // GestureDetector extends Widget
        // GestureDetector GestureDetector: creates a widget that detects gestures.
        return GestureDetector(
            // onTap: void Function()?
            onTap: onNewVideoSelect,   // set field
            child: Image.asset('asset/img/logo.png', ),
        );
    } // build
} // end class

