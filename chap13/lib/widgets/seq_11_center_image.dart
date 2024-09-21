import 'package:flutter/material.dart';
import '../shared/seq_01_library.dart';


class CenterImage extends StatelessWidget {
      const CenterImage({super.key});


      @override
      Widget build(BuildContext context) {
          console('build($context) invoked.');

          return Center(
                  child: Image.asset('asset/img/home_img.png'),
              );
      } // build

} // end class

