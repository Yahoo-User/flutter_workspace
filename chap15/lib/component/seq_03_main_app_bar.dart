import 'package:flutter/material.dart';

import '../util/logger.dart';


class MainAppBar extends StatelessWidget {
    // ( dart:ui )  typedef VoidCallback = void Function()
    final VoidCallback? onPickBackgroundImage;
    final VoidCallback? onSaveMergedImage;
    final VoidCallback? onDeleteSticker;


    const MainAppBar({
        super.key,

        required this.onPickBackgroundImage,
        required this.onSaveMergedImage,
        required this.onDeleteSticker,
    });

    @override
    Widget build(BuildContext context) {
        console('build(context: $context) invoked.');

        /**
         *  =====================================
         *  Container extends StatelessWidget
         *  =====================================
         *  Creates a widget that combines common painting, positioning, and sizing widgets.
         *  The height and width values include the padding.
         *  The color and decoration arguments cannot both be supplied, since it would potentially result in the decoration drawing over the background color.
         *  To supply a decoration with a color, use decoration: BoxDecoration(color: color).
         */
        return Container(
            height: 70,

            decoration:
                BoxDecoration(color: Colors.white.withOpacity(.9)),
                // const BoxDecoration(color: Colors.white70),

            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <StatelessWidget>[
                    IconButton(onPressed: onPickBackgroundImage, icon: const Icon(Icons.image_search_outlined, color: Colors.red) ),
                    IconButton(onPressed: onSaveMergedImage, icon: const Icon(Icons.save, color: Colors.green)),
                    IconButton(onPressed: onDeleteSticker, icon: const Icon(Icons.delete_forever_outlined, color: Colors.blue)),
                ],
            )
        );
    }
}


