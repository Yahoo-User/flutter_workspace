import 'package:flutter/material.dart';
import './util/logger.dart';

import './screen/home_widget_2.dart';


void main(List<String> args) {
      console('main($args, ${args.length} invoked.');

      runApp(const MaterialApp(
          home: HomeWidget(),
      ));

      return;
}


