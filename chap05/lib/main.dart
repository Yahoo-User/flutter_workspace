import 'package:flutter/material.dart';


void main() {

    runApp(
        // *Important: Use 'const' keyword with the constructor to improve performance.
        const
        // final                // XX, Expected an identifier.
        MaterialApp(
            home: Scaffold(
                body: Center(
                    child: Text(
                        "Hello Code Factory"
                    ),
                ),
            ),
        ),
    );  // runApp


    return;
}
