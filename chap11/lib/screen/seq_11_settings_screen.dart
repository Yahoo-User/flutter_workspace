import 'package:flutter/material.dart';
import '../util/logger.dart';

import '../const/seq_1_colors.dart';


class SettingsScreen extends StatelessWidget {
    // *Important: can't have a `late final field` in a class with a generative `const constructor`.
    final double threshold;

    // typedef ValueChanged<T> = void Function(T value);
    final ValueChanged<double> onThresholdChange;   // called back during a drag in the Slider widget.


    const
    SettingsScreen({
        super.key,

        required this.threshold,
        required this.onThresholdChange,
    }); // Constructor

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[ // List<Widget>
                Padding(
                    padding: // An immutable set of offsets in each of the four cardinal directions.
                        // EdgeInsets.only: Creates insets with only the given values non-zero.
                        const EdgeInsets.only(left: 23.0),

                    child: Row(
                        children: <Widget>[ // List<Widget>
                            Text(
                                'Sensitivity',

                                style: TextStyle(
                                    color: secondaryColor,

                                    fontFamily: 'D2Coding',
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                ),
                            ),
                        ],
                    ),
                ),

                Slider(
                    min: .0,
                    max: 10.0,
                    divisions: 101,     // The number of discrete divisions.

                    label: threshold.toStringAsFixed(1),    // A label to show above the slider when the slider is active.
                    value: threshold,   // The currently selected value for this slider.

                    // Called during a drag when the user is selecting a new value for the slider by dragging.
                    onChanged: onThresholdChange,
                )
            ],
        );
    } // build

} // end class

