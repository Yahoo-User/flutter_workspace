import 'package:flutter/material.dart';
import '../util/logger.dart';

import '../const/seq_1_colors.dart';


class HomeScreen extends StatelessWidget {  // With no state management.
    final int diceNumber;


    const HomeScreen({super.key, required this.diceNumber});

    @override
    Widget build(BuildContext context) {    // Only once executed to render all widgets.
        console('build($context) invoked.');
        console('\t+ this.diceNumber: $diceNumber');

        return Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [ // List
                Center(child: Image.asset('asset/img/$diceNumber.png'), ),
                const SizedBox(height: 32.0, ),

                Text(
                    'Dice Number',

                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                    ),
                ),

                const SizedBox(height: 32.0, ),

                Text(
                    diceNumber.toString(),

                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                    ),
                ),
            ],
        );
    } // build

} // end class

