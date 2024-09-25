import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../util/logger.dart';

import '../component/seq_03_main_app_bar.dart';
import '../component/seq_07_footer.dart';


class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override State<HomeScreen> createState() => _HomeScreenState();
}


/*
 * ---------------
 * XFile
 * ---------------
 * A CrossFile is a cross-platform, simplified file abstraction.
 * It wraps the bytes of a selected file, and its (platform-dependant) path.
 */
class _HomeScreenState extends State<HomeScreen> {
    // Declares States.
    XFile? image;                       // In the `image_picker` package.


    @override
    Widget build(BuildContext context) {
        console('build(context: $context) invoked.');

        return Scaffold(
            body: Stack(
                children: [
                    renderBody(),

                    Positioned(
                        top: 0, left: 0, right: 0,

                        child: MainAppBar(
                            onPickBackgroundImage: onPickBackgroundImage,
                            onSaveMergedImage: onSaveMergedImage,
                            onDeleteSticker: onDeleteSticker
                        ),
                    ),

                    if(image != null)
                        Positioned(
                            bottom: 0, left: 0, right: 0,

                            child: Footer( onEmoticonTap: onEmoticonTap ),
                        ),
                ],
            ),
        );
    }

    void onEmoticonTap(int index) {
        console('onEmoticonTap(index: $index) invoked.');

    }

    Widget renderBody() {
        console('renderBody() invoked.');

        if(image != null) {                         // (1) If a image file chosen,

            return Positioned.fill(             // Creates a Positioned object with left, top, right, and bottom set to 0.0 unless a value for them is passed
                // top: 70,
                top: 0,
                left: 0,

                child: InteractiveViewer(     // The widget that enables the child widget to scale and translate by x-axis or y-axis.

                    child: Image.file(             // Creates a widget that displays an ImageStream obtained from a File.
                        File(image!.path),        // dart:io - (new) File File(String path) : creates a File object.
                        fit: BoxFit.cover           // As small as possible while still covering the entire target box.
                    ),

                )
            );

        } else {                                           // (2) If a image file Not chosen,

            return Center(                          // Creates a widget that centers its child.
                child: TextButton(
                    style: TextButton.styleFrom( foregroundColor: Colors.white, backgroundColor: Colors.red ),
                    onPressed: onPickBackgroundImage,
                    child: const Text('Please choose a image file.'),
                ),
            );

        }
    }

    //  Callbacks On Each Button Defined In The App Bar.
    void onPickBackgroundImage() async {
        console('onPickBackgroundImage() invoked.');

        // Type: XFile?
        final image = await ImagePicker().pickImage( source: ImageSource.gallery );     // 1, from gallery.
        // final image = await ImagePicker().pickImage(source: ImageSource.camera);     // 2. snapshot from camera.

        console('Picked Image: ${image?.name}, ${image?.length()}, ${image?.path}, ${image?.mimeType}, ${image?.lastModified()}'); // 1
        inspect(image);     // 2, `dart: developer`  exported from Dart SDK

        setState(() {   // Update state -> Dirty State -> Re-render by build(context) -> Clean State.
            console('Updated `image` state.');
            this.image = image;
        });
    }

    void onSaveMergedImage() {
        console('onSaveMergedImage() invoked.');

    }

    void onDeleteSticker() {
        console('onDeleteSticker() invoked.');

    }
}


