import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

    // Declare a async function to re-render by async result with check location service permission.
    Future<String> checkPermission() async {
        console('checkPermission() invoked.');

        /**
         * -----------------------------------
         * Geolocator.checkPermission()
         * -----------------------------------
         * Returns a Future containing a bool value indicating whether location services are enabled on the device.
         */
        final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

        if(!isLocationServiceEnabled) {
            return "Please enable location service in your phone.";
        }   // if

       /**
         * -----------------------------------
         * Geolocator.checkPermission()
         * -----------------------------------
         * Returns a Future indicating if the user allows the App to access the device's location.
         */
        final locationPermission = await Geolocator.checkPermission();

        if(locationPermission == LocationPermission.denied) {

           /**
             * -----------------------------------
             * Geolocator.requestPermission()
             * -----------------------------------
             * Request permission to access the location of the device.
             * Returns a Future which when completes indicates if the user granted permission to access the device's location.
             * Throws a `PermissionDefinitionsNotFoundException` when the required platform specific configuration is missing
             *  (e. g. in the AndroidManifest. xml on Android or the Info. plist on iOS).
             * A `PermissionRequestInProgressException` is thrown
             * if permissions are requested while an earlier request has not yet been completed.
             */
            final requestPermission = await Geolocator.requestPermission();

            if(requestPermission == LocationPermission.denied) {
                return "Please allow the app to access your location.";
            }   // if

        }   // if

        // ---------
        if(locationPermission == LocationPermission.deniedForever) {
            return "Please allow the app to access your location from the Settings.";
        }   // if

        // ---------
        return "The permission to access your location is completely allowed.";
    }   // checkPermission

} // end class

