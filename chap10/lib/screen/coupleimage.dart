import 'package:flutter/material.dart';
import '../util/logger.dart';


class CoupleImage extends StatelessWidget {    // Without state management.

  // --------------------------------
  // *Important: const constructors can't have a body. (***)
  // *Important: the constructor being called isn't a `const` constructor. (***)
  // *Important: the constructors for public widgets should have a named 'key' parameter. (***)
  // *Important: the constructors in '@immutable' classes should be declared as 'const'. (***)
  // --------------------------------
  // const CoupleImage({Key? key}): super(key: key);    // 1
  // const CoupleImage({super.key});                    // 2

  CoupleImage({super.key}) {                          // 3
    console('CoupleImage::Constructor($key) invoked.');
  } // Constructor


  @override
  Widget build(BuildContext context) {      // Render only once.    (***)
    console('CoupleImage::build($context) invoked.');
    console('\t+ Screen Size: width(${MediaQuery.of(context).size.width}), height(${MediaQuery.of(context).size.height}).');

    return Expanded(
      child: Center(
        child: Image.asset(
          'asset/img/middle_image.png',
          height: MediaQuery.of(context).size.height.toInt() / 2,     // Ignored by Expended widget. (***)
        ),
      ),
    );
  } // build

} // end class

