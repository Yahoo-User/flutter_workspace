import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

import '../util/logger.dart';

import '../component/seq_03_main_app_bar.dart';
import '../component/seq_07_footer.dart';

import '../model/seq_10_sticker_model.dart';

// import '../component/seq_09_emoticon_sticker.dart';
// import '../component/seq_12_emoticon_sticker.dart';
import '../component/seq_13_emoticon_sticker.dart';


class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
    // Declares States.
    XFile? image;                       // In the `image_picker` package.
    Set<StickerModel> stickers = <StickerModel> {};      // Create an Empty Set Literal of Element Type: `StickerModel`
    int selectedId = 0;   // Selected Sticker Id


    @override
    Widget build(BuildContext context) {
        console('build(context: $context) invoked.');

        return Scaffold(
            body: Stack(
                children: <Widget> [
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

    Widget renderBody() {
        console('renderBody() invoked.');

        if(image != null) {                         // (1) If a image file chosen,
            return Positioned.fill(             // Creates a Positioned object with left, top, right, and bottom set to 0.0 unless a value for them is passed
                // top: 70,
                top: 0,
                left: 0,

                child: InteractiveViewer(     // The widget that enables the child widget to scale and translate by x-axis or y-axis.
                    child: Stack(
                        fit: StackFit.expand,

                        children: [
                            Image.file(                      // Creates a widget that displays an ImageStream obtained from a File.
                                File(image!.path),      // dart:io - (new) File File(String path) : creates a File object.
                                fit: BoxFit.cover,        // As small as possible while still covering the entire target box.
                            ),

                            ...stickers.map((sticker) => Center(
                                    child: EmoticonSticker(
                                        key: ValueKey<int>(sticker.id),

                                        onTransform: onTransform,
                                        imgPath: sticker.imgPath,
                                        isSelected: (selectedId == sticker.id),
                                    ),
                                ),
                            ),  // .map
                        ],
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


    /*
     *  ================================
     *  (1) Dart:core : Iterable<StickerModel> where(bool Function(StickerModel) test)
     *  ================================
     *  Containing class: Iterable
     *
     *  Creates a new lazy Iterable with all elements that satisfy the predicate test.
     *  The matching elements have the same order in the returned iterable as they have in iterator.
     *  This method returns a view of the mapped elements.
     *  As long as the returned Iterable is not iterated over, the supplied function test will not be invoked.
     *  Iterating will not cache results, and thus iterating multiple times over the returned Iterable
     *  may invoke the supplied function test multiple times on the same element.
     *
     *  ================================
     *  (2) Dart:core : void removeWhere(bool Function(StickerModel) test)
     *  ================================
     *  Containing class: Set
     *
     *  Removes all elements of this set that satisfy test.
     *
     */
    void onDeleteSticker() async {
        console('onDeleteSticker($selectedId) invoked.');

        setState(() {   // Update state: stickers
            // stickers = stickers.where( (sticker) => (sticker.id != selectedId) ).toSet();   // 1st. method   - In-correct (***)
            stickers.removeWhere( (sticker) => (sticker.id == selectedId) );                   // 2nd. method  - Correct (***)
        });
    }

    void onEmoticonTap(int index) async {
        console('onEmoticonTap(index: $index) invoked.');

        // selectedId = const Uuid().v4();   // With `uuid` package
        selectedId = index;

        setState(() {   // Update state: `stickers`
            stickers = <StickerModel> {
                ...stickers,    // Spread Operator

                // Append New Selected StickerModel
                StickerModel(id: index, imgPath: 'assets/img/emoticon_$index.png'),
            };
        }); // setState
    }

    void onTransform(int id) {
        console('onTransform($id) invoked.');

        setState(() {   // Update state: `selectedId`.
            selectedId = id;
        });
    }
}


