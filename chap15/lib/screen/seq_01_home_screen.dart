import 'package:flutter/material.dart';

import '../util/logger.dart';


class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        console('build(context: $context) invoked.');
        // throw UnimplementedError();

        return const Scaffold(
            body: Text('HomeScreen Widget'),
        );
    }
}

