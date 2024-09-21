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

        return const GoogleMap(  // Creates a widget displaying data from Google Maps services, StatefulWidget.
            initialCameraPosition:    // The initial position of the map's camera.
                CameraPosition(         // Creates a immutable representation of the GoogleMap camera.
                    target: companyLocation,    // The geographical location that the camera is pointing at.
                    zoom: 17,                            // The zoom level of the camera.
                ),
        );
    } // renderBody

} // end class

