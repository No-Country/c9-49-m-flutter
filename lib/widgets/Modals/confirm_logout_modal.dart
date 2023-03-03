import "package:flutter/material.dart";

// Theme
import '../../theme/colors_theme.dart';

Future<void> showConfirmModal(BuildContext context,
    {required String title,
    required String description,
    required void Function() onConfirm}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color.fromRGBO(86, 103, 137, 0.26)),
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      onPressed: onConfirm,
                      child: Container(
                          width: 80.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(21, 25, 32, 0.5),
                            ),
                            textAlign: TextAlign.center,
                          ))),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: LightModeColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Container(
                          width: 80.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ))),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
