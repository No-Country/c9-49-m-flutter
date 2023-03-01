import "package:flutter/material.dart";
import "package:flutter_application_1/data/languages.dart";
import "package:flutter_application_1/types/user_form_data.dart";
import "package:flutter_svg/flutter_svg.dart";

class UserDecriptionStep extends StatelessWidget {
  final UserFormData formData;
  final PageController pageController;

  const UserDecriptionStep({
    Key? key,
    required this.formData,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Agrega una descripción a tu perfil",
            style: TextStyle(fontSize: 30),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText:
                    "Escribe una descripción para que \npuedas encontrar más usuarios en Speak Easy",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 20),
              ),
              initialValue: formData.userDescription,
              onSaved: (value) => formData.userDescription = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una breve descripción';
                }
                return null;
              },
              style: const TextStyle(fontSize: 18),
            ),
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
                fixedSize: const Size(120, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              'Continuar',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
