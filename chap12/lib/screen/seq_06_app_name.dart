import 'package:flutter/material.dart';
import '../util/logger.dart';


class AppName extends StatelessWidget {
    const AppName({super.key});

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        const textStyle = TextStyle(
            color: Colors.grey,

            fontFamily: 'D2Coding',
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
        );

        return Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
                const Text(
                    'VIDEO',

                    style: textStyle,
                ),

                Text(
                    'PLAYER',

                    style: textStyle.copyWith(
                        color: Colors.white,
                    ),
                ),
            ],
        );
    } // build
} // end class


