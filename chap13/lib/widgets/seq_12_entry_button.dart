import 'package:flutter/material.dart';
import '../shared/seq_01_library.dart';

// import './seq_13_cam_screen.dart';
// import './seq_14_cam_screen.dart';
import './seq_15_cam_screen.dart';


class EntryButton extends StatelessWidget {

    const EntryButton({super.key});


    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,

                            textStyle: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'D2Coding',
                                fontWeight: FontWeight.bold,
                            )
                        ),

                        onPressed: () {
                            console('onPressed() invoked.');

                            // Navigator.of(context).push( MaterialPageRoute( builder: (_) => const CamScreen() ) );      // 1
                            Navigator.push( context, MaterialPageRoute( builder: (_) => const CamScreen() ) );          // 2
                        },

                        child: const Text('Enter'),
                    ),
                ],
            );
    } // build

} // end class


