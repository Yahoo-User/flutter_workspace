import 'package:chap09/screen/home_widget.dart';

import './util/logger.dart';
import 'package:flutter/material.dart';


void main(List<String> args) {
      console('main($args, ${args.length} invoked.');

      runApp(const MaterialApp(
          home: HomeWidget(),
      ));

      return;
}


