import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../util/logger.dart';


class HomeScreen extends StatelessWidget {
    static const LatLng companyLocation = LatLng(37.5233273, 126.921252);

    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');

        return Scaffold(
            appBar: renderAppBar(),
            body: renderBody(),
        );
    } // build

    AppBar renderAppBar() {
        console('renderAppBar() invoked.');

        return AppBar(
            backgroundColor: Colors.deepPurple,
            toolbarHeight: 80.0,

            centerTitle: true,
            title: const Text(
                "Check Presence",

                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.0,

                    fontFamily: 'Economica',
                    fontSize: 38.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                )
            ),
        );
    } // renderAppBar

    Widget? renderBody() {
        console('renderBody() invoked.');

        return Column(
            children: <Widget> [
                // Creates a widget that expands a child of a Row, Column, or Flex
                // so that the child fills the available space along the flex widget's main axis. (default, flex = 1)
                const Expanded(
                    flex: 5,

                    child: GoogleMap(  // Creates a widget displaying data from Google Maps services, StatefulWidget.
                        initialCameraPosition:    // The initial position of the map's camera.
                            CameraPosition(         // Creates a immutable representation of the GoogleMap camera.
                                target: companyLocation,    // The geographical location that the camera is pointing at.
                                zoom: 17,                            // The zoom level of the camera.
                            ),
                    ),
                ),

                // Creates a widget that expands a child of a Row, Column, or Flex
                // so that the child fills the available space along the flex widget's main axis. (default, flex = 1)
                Expanded(
                    // flex: 1,

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                            const Icon(
                                Icons.timelapse_outlined,
                                color: Colors.blue,
                                size: 40.0,
                            ),

                            // const SizedBox(height: 0.0),

                            ElevatedButton(
                                onPressed: () {
                                    console('+ ElevatedButton::onPressed() invoked.');
                                },

                                child: const Text(
                                    'Presence !',
                                    style: TextStyle(
                                        color: Colors.red,
                                        letterSpacing: 1.0,

                                        fontFamily: 'Economica',
                                        fontSize: 26.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                            ),
                        ],
                    )
                ),
            ],
        );
    } // renderBody

} // end class

