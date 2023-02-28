import "package:flutter/material.dart";
import 'package:flutter_application_1/data/languages.dart';
import 'package:flutter_application_1/types/user_form_data.dart';
import 'package:flutter_application_1/widgets/Modals/errors_preferences_modal.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TargetLangStep extends StatelessWidget {
  final UserFormData formData;
  final PageController pageController;
  final Function onChangeTargetLanguage;

  const TargetLangStep(
      {Key? key,
      required this.formData,
      required this.pageController,
      required this.onChangeTargetLanguage});

  @override
  Widget build(BuildContext context) {
    String selectedLanguageCode = formData.targetLanguage;

    List<Widget> languageButtons = languages.map((language) {
      String? code = language['code'];
      bool isSelected = code == selectedLanguageCode;

      return ElevatedButton(
        onPressed: () {
          onChangeTargetLanguage(language['code']);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? const Color.fromRGBO(0, 0, 0, 0.1)
              : const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide.none,
          ),
          elevation: 0,
          fixedSize: const Size(100, 60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/flags/$code.svg',
                  height: 35, // altura deseada del icono
                  width: 50, // ancho deseado del icono
                ),
                const SizedBox(width: 25),
                Text(
                  language['name']!,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            isSelected
                ? Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: const [
                        Positioned.fill(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Elegí el idioma que quieras aprender",
          style: TextStyle(fontSize: 35),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 320,
          child: ListView(
            shrinkWrap: true,
            children: languageButtons.map((button) => button).toList(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
          child: ElevatedButton(
            onPressed: () {
              if (formData.nativeLanguage == formData.targetLanguage) {
                showErrorDialog(context,
                    titleText: 'Idioma',
                    descriptionText:
                        'El idioma el cual pongas como objetivo aprender no puede ser el mismo que tu idioma nativo');

                return;
              }
              if (Form.of(context).validate()) {
                Form.of(context).save();
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              'Continuar',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
