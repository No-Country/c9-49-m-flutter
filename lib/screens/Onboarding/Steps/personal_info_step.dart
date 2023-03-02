import "package:flutter/material.dart";
import 'package:flutter_application_1/utils/has_legal_age.dart';
import "package:flutter_application_1/widgets/Modals/errors_preferences_modal.dart";
import "package:intl/intl.dart";
import "../../../types/user_form_data.dart";
import "../../../widgets/Buttons/primary_button.dart";

class PersonalInfoStep extends StatelessWidget {
  final UserFormData formData;
  final PageController pageController;
  final Function onChangeGender;
  final Function onChangeBorn;

  const PersonalInfoStep({
    Key? key,
    required this.formData,
    required this.pageController,
    required this.onChangeGender,
    required this.onChangeBorn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: const Text(
            "Actualiza tus datos personales para mejores recomendaciones",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto'),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
                    hintStyle:
                        const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(98, 0, 238, 1)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    )),
                initialValue: formData.name,
                onSaved: (value) => formData.name = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  } else if (RegExp(r'\d+').hasMatch(value)) {
                    return 'Su nombre no puede contener números';
                  } else if (!RegExp(
                          r'^[a-zA-ZñÑáéíóúÁÉÍÓÚ]+\s+[a-zA-ZñÑáéíóúÁÉÍÓÚ]+$')
                      .hasMatch(value)) {
                    return 'Ingrese su nombre y apellido';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                key: ValueKey(formData.born),
                decoration: InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
                    hintStyle:
                        const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(98, 0, 238, 1)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    )),
                initialValue: formData.born,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2022),
                      firstDate: DateTime(1930),
                      lastDate: DateTime(2022));

                  if (newDate == null) return;

                  onChangeBorn(DateFormat('dd-MM-yyyy').format(newDate));
                },
                validator: (value) {
                  print(value);

                  if (value!.isEmpty) {
                    return 'Por favor ingrese su fecha de nacimiento';
                  } else if (!RegExp(r'\d+').hasMatch(value)) {
                    return "Ingrese la fecha en formato dd-mm-aaaa";
                  } else if (!hasLegalAge(value)) {
                    return 'Debes ser mayor a 18 años para utilizar la aplicación';
                  }
                  return null;
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: formData.gender == "masculino"
                            ? const Color.fromARGB(255, 140, 255, 144)
                            : Colors.white),
                    onPressed: () => {onChangeGender("masculino")},
                    child: const Text(
                      "Masculino",
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: formData.gender == "femenino"
                            ? Colors.green
                            : Colors.white),
                    onPressed: () => {onChangeGender("femenino")},
                    child: const Text(
                      "Femenino",
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: formData.gender == "otro"
                            ? Colors.green
                            : Colors.white),
                    onPressed: () => {onChangeGender("otro")},
                    child: const Text(
                      "Otro",
                      style: TextStyle(color: Colors.black),
                    )),
              ]),
              const SizedBox(
                height: 35,
              ),
              PrimaryButton(
                text: 'Continuar',
                onPressed: () {
                  if (formData.gender == "") {
                    showErrorDialog(context,
                        titleText: 'Elige un género',
                        descriptionText:
                            'Para continuar necesitamos que selecciones una opción.');
                  }
                  if (Form.of(context).validate()) {
                    Form.of(context).save();
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
