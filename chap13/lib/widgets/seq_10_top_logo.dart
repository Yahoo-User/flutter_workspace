import 'package:flutter/material.dart';
import '../shared/seq_01_library.dart';


class TopLogo extends StatelessWidget {

    const TopLogo({super.key});

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(14.0),
                        boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.blue[300]!,
                                blurRadius: 12.0,
                                spreadRadius: 6.0,
                            ),
                        ]
                    ),

                    child: const Padding(
                        padding: EdgeInsets.all(16.0),

                        child: Row(
                            mainAxisSize: MainAxisSize.min,

                            children: <Widget>[
                                Icon(
                                    Icons.videocam,
                                    color: Colors.white,
                                    size: 40.0,
                                ),

                                SizedBox(width: 12.0),

                                Text(
                                    'LIVE',
                                    style: TextStyle(
                                        color: Colors.white,

                                        letterSpacing: 5.0,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                )
                            ],
                        ),
                    ),
                ),
            );
    } // build
} // end class

