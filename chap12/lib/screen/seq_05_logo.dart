import 'package:flutter/material.dart';
import '../util/logger.dart';


class Logo extends StatelessWidget {
    const Logo({super.key});

    @override
    Widget build(BuildContext context) {
        console('build($context) invoked.');
        return Image.asset('asset/img/logo.png', );
    } // build
} // end class

