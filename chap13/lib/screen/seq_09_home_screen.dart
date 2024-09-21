import 'package:flutter/material.dart';
import '../shared/seq_01_library.dart';

import '../widgets/seq_10_top_logo.dart';
import '../widgets/seq_11_center_image.dart';
import '../widgets/seq_12_entry_button.dart';


class HomeScreen extends StatelessWidget {

    const HomeScreen({super.key});


    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return Scaffold(
                backgroundColor: Colors.grey[300]!,

                body: const SafeArea(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),

                        child: Column(
                            children: <Widget>[
                                Expanded(child: TopLogo()),
                                Expanded(child: CenterImage()),
                                Expanded(child: EntryButton()),
                            ],
                        ),
                    ),
                ),
            );
    } // build

} // end class


