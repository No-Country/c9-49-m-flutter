import "package:flutter/material.dart";

Future<void> showErrorDialog(BuildContext context,
    {required String titleText, required String descriptionText}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          titleText,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
          textAlign: TextAlign.center,
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        content: Text(
          descriptionText,
          style: TextStyle(color: Color.fromARGB(255, 148, 0, 0), fontSize: 18),
          textAlign: TextAlign.center,
        ),
        contentTextStyle: TextStyle(color: Colors.white),
      );
    },
  );
}
