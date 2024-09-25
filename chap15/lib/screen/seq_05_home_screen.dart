import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../util/logger.dart';

import '../component/seq_03_main_app_bar.dart';


/*
 *  -----------------
 *  1. Scaffold
 *  -----------------
 *  Creates a visual scaffold for Material Design widgets.
 *
 *  -----------------
 *  2-1. Stack
 *  -----------------
 *  Creates a stack layout widget.
 *  By default, the non-positioned children of the stack are aligned by their top left corners.
 *
 *  -----------------
 *  2-2. enum StackFit
 *  -----------------
 *  How to size the non-positioned children of a Stack.
 *  This enum is used with Stack. fit and RenderStack.
 *  fit to control how the BoxConstraints passed from the stack's parent to the stack's child are adjusted.
 *
 *  Enum constants:
 *      (1) expand - The constraints passed to the stack from its parent are tightened to the biggest size allowed.
 *      (2) loose - The constraints passed to the stack from its parent are loosened.
 *      (3) passthrough - The constraints passed to the stack from its parent are passed unmodified to the non-positioned children.
 *
 *  See also:
 *      Stack, the widget that uses this.
 *      RenderStack, the render object that implements the stack algorithm.
 *
 *  -----------------
 *  3. Positioned
 *  -----------------
 *  Creates a widget that controls where a child of a Stack is positioned.
 *  Only two out of the three horizontal values (left, right, width), and only two out of the three vertical values (top, bottom, height), can be set.
 *  In each case, at least one of the three must be null.
 *
 *  See also:
 *      Positioned. directional, which specifies the widget's horizontal position using start and end rather than left and right.
 *      PositionedDirectional, which is similar to Positioned. directional but adapts to the ambient Directionality.
 *
 */
class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    /*
    // 1st. method - Don't put any logic in 'createState'.  (***)
    @override State<HomeScreen> createState() {   //
        return _HomeScreenState();
    }
    */

    // 2nd. method - Don't put any logic in 'createState'.  (***)
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
                fit: StackFit.expand,

                children: [
                    Positioned(
                        top: 0, left: 0, right: 0,

                        child: MainAppBar(
                            onPickBackgroundImage: onPickBackgroundImage,
                            onSaveMergedImage: onSaveMergedImage,
                            onDeleteSticker: onDeleteSticker
                        ),
                    ),
                ],
            ),
        );
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


