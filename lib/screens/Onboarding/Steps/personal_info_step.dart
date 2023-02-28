import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "../../../types/user_form_data.dart";

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
        SizedBox(
          height: 30,
        ),
        const Text(
          "Actualiza tus datos personales para mejores recomendaciones",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
                    hintStyle:
                        const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
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
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                key: ValueKey(formData.born),
                decoration: InputDecoration(
                    labelText: 'Cumpleaños',
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
                onChanged: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: formData.gender == "masculino"
                            ? Color.fromARGB(255, 140, 255, 144)
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
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Form.of(context).validate()) {
                    Form.of(context).save();
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 50),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
