import 'package:flutter/material.dart';
import '../util/logger.dart';


class CustomIconButton extends StatelessWidget {
    final GestureTapCallback onPressed;
    final IconData iconData;


    // *Important: Named parameters can't start with an underscore.
    const CustomIconButton({   // Constructor with required named parameters.
        required this.onPressed,
        required this.iconData,

        super.key,
    });

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return IconButton(
            iconSize: 30.0,
            color: Colors.white,
            onPressed: onPressed,
            icon: Icon(iconData, ),
        );
    } // build

} // end class

