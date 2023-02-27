import 'package:flutter/material.dart';

Future<void> showCircleLoader(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
