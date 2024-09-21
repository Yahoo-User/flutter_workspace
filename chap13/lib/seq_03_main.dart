import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './shared/seq_01_library.dart';

import './widgets/seq_04_camera_app.dart';


/*
 * --------------------------------------
 * (1) WidgetsFlutterBinding
 * --------------------------------------
 * A concrete binding for applications based on the Widgets framework.
 * This is the glue that binds the framework to the Flutter engine.
 * When using the widgets framework, this binding, or one that implements the same interfaces, must be used.
 *
 * The following mixins are used to implement this binding:
 *      (1) GestureBinding          :   implements the basics of hit testing.
 *      (2) SchedulerBinding      :   introduces the concepts of frames.
 *      (3) ServicesBinding         :   provides access to the plugin subsystem.
 *      (4) PaintingBinding         :  enables decoding images.
 *      (5) SemanticsBinding     :   supports accessibility.
 *      (6) RendererBinding       :   handles the render tree.
 *      (7) WidgetsBinding         :   handles the widget tree.
 *
 * --------------------------------------
 * (2) Future<T>
 * --------------------------------------
 *  The result of an asynchronous computation.
 *  Refs: https://chatgpt.com/share/19f15c8d-0c28-45ec-a1a9-405f31b9c4de
 *
 */
Future<void> main()  async {
    console('main() invoked.');

    // ----------
    // Refs : https://chatgpt.com/share/ef75936d-439e-4d50-a622-4c205240c0b2
    WidgetsFlutterBinding.ensureInitialized();


    // ----------

    /**
     * -----------------------
     * Future<List<CameraDescription>> availableCameras()
     * -----------------------
     *  Completes with a list of available cameras.  (***)
     *  May throw a CameraException.
     */
    cameras = await availableCameras();
    cameras.forEach(console);


    // ----------
    runApp(const CameraApp());
} // main

