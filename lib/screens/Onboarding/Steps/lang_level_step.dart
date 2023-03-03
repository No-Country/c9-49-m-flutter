import "package:flutter/material.dart";
import "package:flutter_application_1/data/languages.dart";
import "package:flutter_application_1/types/user_form_data.dart";
import "package:flutter_application_1/widgets/Buttons/primary_button.dart";
import "./../../../utils/formating_strings.dart";

class LangLevelStep extends StatelessWidget {
  final UserFormData formData;
  final PageController pageController;
  final Function onChangeLevelTargetLang;

  const LangLevelStep(
      {Key? key,
      required this.formData,
      required this.pageController,
      required this.onChangeLevelTargetLang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedLevel = formData.levelTarget;
    String? targetLang = "";
    List<String> levels = [
      "principiante",
      "elemental",
      "intermedio",
      "Avanzado"
    ];

    Iterable<Row> levelButtons = levels.map((element) {
      bool isSelected = element == selectedLevel;
      double strokeSide = isSelected ? 2 : 0;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () => {onChangeLevelTargetLang(element)},
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected
                      ? const Color.fromRGBO(0, 0, 0, 0.1)
                      : const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                        color: const Color.fromRGBO(167, 167, 167, 1),
                        strokeAlign: strokeSide,
                        width: strokeSide),
                  ),
                  elevation: 0,
                  fixedSize: const Size(100, 50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    capitalize(element),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.start,
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
            ),
          ),
        ],
      );
    });

    for (var language in languages) {
      {
        if (language['code'] == formData.targetLanguage) {
          targetLang = language['name'];
        }
      }
    }

    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(
          "Nivel de $targetLang",
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          height: 300,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: levelButtons.map((button) => button).toList()),
        ),
        PrimaryButton(
          text: 'Continuar',
          onPressed: () {
            if (Form.of(context).validate()) {
              Form.of(context).save();
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        )
      ],
    );
  }
}
