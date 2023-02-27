import "package:flutter/material.dart";
import "package:flutter_application_1/data/languages.dart";
import "package:flutter_application_1/types/user_form_data.dart";
import "package:flutter_application_1/utils/formating_strings.dart";
import "package:flutter_svg/flutter_svg.dart";

class UserHobbiesStep extends StatelessWidget {
  final UserFormData formData;
  final PageController pageController;
  final Function onChangeHobbie;
  final Function saveFormData;

  const UserHobbiesStep(
      {Key? key,
      required this.formData,
      required this.pageController,
      required this.onChangeHobbie,
      required this.saveFormData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> hobbies = [
      "deportes",
      "viajar",
      "leer",
      "peliculas",
      "salir con amigos",
      "comer",
      "amigos",
      "cocinar",
      "cine",
      "series"
    ];

    Iterable<ElevatedButton> hobbiesButtons = hobbies.map((element) {
      bool isInHobbies = formData.hobbies!.any((hobbie) => hobbie == element);

      return ElevatedButton(
        onPressed: () => {onChangeHobbie(element)},
        style: ElevatedButton.styleFrom(
            backgroundColor: isInHobbies ? Colors.green : Colors.grey),
        child: Text(capitalize(element)),
      );
    });

    return Column(children: [
      const SizedBox(
        height: 25,
      ),
      const Text(
        "Eligí tus intereses y hobbies",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
      const SizedBox(
        height: 25,
      ),
      Wrap(
        spacing: 10,
        children: hobbiesButtons.map((button) => button).toList(),
      ),
      SizedBox(
        height: 80,
      ),
      ElevatedButton(
        onPressed: () {
          if (Form.of(context).validate()) {
            Form.of(context).save();
            saveFormData();
          }
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 50),
        ),
        child: const Text(
          'Finalizar',
          style: TextStyle(fontSize: 25),
        ),
      ),
    ]);
  }
}
