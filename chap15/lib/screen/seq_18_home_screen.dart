import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

// --- The required imports to capture rendering boundary as a PNG format.
import 'dart:ui' as ui show Image, ImageByteFormat;
import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
import 'package:flutter/services.dart' show ByteData, Uint8List;
import 'package:image_gallery_saver/image_gallery_saver.dart' show ImageGallerySaver;

import 'package:image_picker/image_picker.dart' show XFile, ImagePicker, ImageSource;
import 'package:uuid/uuid.dart' show Uuid;

import '../util/logger.dart';

import '../component/seq_03_main_app_bar.dart';
import '../component/seq_07_footer.dart';

// import '../model/seq_10_sticker_model.dart';
import '../model/seq_16_sticker_model.dart';

// import '../component/seq_09_emoticon_sticker.dart';
// import '../component/seq_12_emoticon_sticker.dart';
// import '../component/seq_13_emoticon_sticker.dart';
import '../component/seq_17_emoticon_sticker.dart';


class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
    // Declares States.
    XFile? image;                                                           // In the `image_picker` package.
    Set<StickerModel> stickers = <StickerModel> {};      // Create an Empty Set Literal of Element Type: `StickerModel`
    String? selectedId;                                                  // Selected Sticker Id

    GlobalKey globalKey = GlobalKey();                        // Widget key to be attracted as a merged image.


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
                top: 0,
                left: 0,

                child: RepaintBoundary(
                    key: globalKey,

                    child:  InteractiveViewer(     // The widget that enables the child widget to scale and translate by x-axis or y-axis.
                        child: Stack(
                            fit: StackFit.expand,

                            children: [
                                Image.file(                      // Creates a widget that displays an ImageStream obtained from a File.
                                    File(image!.path),      // dart:io - (new) File File(String path) : creates a File object.
                                    fit: BoxFit.cover,        // As small as possible while still covering the entire target box.
                                ),

                                ...stickers.map((sticker) => Center(
                                        child: EmoticonSticker(
                                            key: ValueKey<String>(sticker.id),

                                            onTransform: onTransform,
                                            imgPath: sticker.imgPath,
                                            isSelected: (selectedId == sticker.id),
                                        ),
                                    ),
                                ),  // .map
                            ],
                        ),
                    )
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


    /*
     *  Example:

        Required imports:
            (1) import 'dart:ui' as ui show Image, ImageByteFormat;
            (2) import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
            (3) import 'package:flutter/services.dart' show ByteData, Uint8List;

            Future<void> _capturePng() async {
                final RenderRepaintBoundary boundary = globalKey. currentContext!.findRenderObject()! as RenderRepaintBoundary;
                final ui. Image image = await boundary. toImage();
                final ByteData? byteData = await image. toByteData(format: ui. ImageByteFormat. png);
                final Uint8List pngBytes = byteData!.buffer. asUint8List();     // List<int>
                *
                print(pngBytes);        // List<int>
            }
     */
    void onSaveMergedImage() async {
        console('onSaveMergedImage() invoked.');

        // Step1. Capture current rendering boundary to the PNG format image.
        final RenderRepaintBoundary boundary = globalKey. currentContext!.findRenderObject()! as RenderRepaintBoundary;
        final ui.Image image = await boundary.toImage();
        final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        final Uint8List pngBytes = byteData!.buffer.asUint8List();      // List<int>

        // Step2. Save the above PNG format image data into the Gallery.
        await ImageGallerySaver.saveImage(pngBytes, quality: 100, name: 'test.png');

        // Step3. Show save result to the user with snack bars.
        if (!context.mounted) return;

        ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Text('Successfully saved PNG image into the gallery.') ) );
        ScaffoldMessenger.maybeOf(context)!.showSnackBar( const SnackBar(content: Text('Captured Successfully.')) );
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

        // Update state: `stickers`
        setState( () => stickers = <StickerModel> {
                ...stickers,    // Spread Operator
                StickerModel(id: const Uuid().v4(), imgPath: 'assets/img/emoticon_$index.png'), // Append New Selected StickerModel
            }
        ); // setState
    }


    void onTransform(String id) {
        console('onTransform($id) invoked.');

        // Update state: `selectedId`.
        setState( () => selectedId = id );
    }
}


