import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../shared/seq_01_library.dart';

import './seq_04_camera_app.dart';


class CameraAppState extends State<CameraApp> {
    late CameraController controller;


    @override
    void initState() {
        console('2. initState() invoked.');
        super.initState();

        _initializeCamera();
    } // initState

    _initializeCamera() async {    // dynamic initializeCamera()
        console('_initializeCamera() invoked.');

        // Refs: https://chatgpt.com/share/8278138d-7366-4449-8ca7-7ebc411e633c
        //          https://chatgpt.com/share/4433fcb7-b249-4164-8a62-02cb5301344d
        //          https://chatgpt.com/share/2a133378-5b8b-44d8-9d3d-5f6cbab59927

        try {
            // Refs : https://chatgpt.com/share/79922f19-eb36-4c76-b53e-b4eb2cf85e36
            controller = CameraController(cameras.first, ResolutionPreset.max);
            console('\t+ controller: $controller');

            // Initializes the camera on the device.
            // Throws a `CameraException` if the initialization fails.
            await controller.initialize();

            // Update State -> Dirty State -> Re-rendered by build(context) -> Clean state.
            setState(() => console('3. setState() invoked.'));
        } on CameraException catch(e) {
            switch(e.code) {
                case 'CameraAccessDenied': console('Access denied for the camera.'); break;
                default : console('Other Error: ${e.code}');
            } // switch
        } catch(e) {
            console('Exception type: ${ e.runtimeType }, message: ${ e.toString() }');
            rethrow;
        } // try-catch
    } // initializeCamera

    @override
    // Refs : https://chatgpt.com/share/cbdf73ac-fa07-49fd-8375-bb6d5dde5e22
    void dispose() {
        console('5. dispose() invoked.');

        // Releases the resources of a CameraController.
        controller.dispose();

        super.dispose();
    } // dispose

    @override
    Widget build(BuildContext context) {
        console('4. build($context) invoked.');

        if(!controller.value.isInitialized) {
            return Container();
        } // if

        return MaterialApp(
                theme: ThemeData.dark(),

                // Creates a preview widget for the given camera controller.
                // Refs : https://chatgpt.com/share/3a6e335f-a921-495f-a72e-3df26701751b
                home: CameraPreview(controller),
            );
  } // build

} // end class



