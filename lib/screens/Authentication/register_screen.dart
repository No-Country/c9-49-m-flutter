import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_application_1/theme/colors_theme.dart';

import "package:flutter/material.dart";
import "package:flutter_application_1/widgets/Loaders/circle_loader.dart";
import "./../../widgets/Inputs/password_input.dart";
// import '../../widgets/Inputs/text_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                Navigator.pushNamed(context, "/login");
              },
              child: const Text(
                "INICIAR SESIÓN",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 34, 90, 187),
                    fontSize: 14),
              ))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(25, 18, 0, 0),
              child: const Text(
                "¡Estamos felices de que seas parte!",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const FormRegister()
          ],
        ),
      ),
    );
  }
}

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  var userCredential;

  final _formKey = GlobalKey<FormState>();
  // static const snackBar = SnackBar(
  //   content: Text('Yay! A SnackBar!'),
  // );

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  bool _passwordHidden = true;
  bool _confirmPasswordHidden = true;
  String? _errorText = null;

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordHidden = true;
    _confirmPasswordHidden = true;
    userCredential = null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Ingrese su mail',
                    hintText: 'ejemplo@gmail.com',
                    suffixIconColor: const Color.fromARGB(255, 0, 0, 0),
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
                    hintStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(98, 0, 238, 1)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(98, 0, 238, 1)),
                    ),
                  ),
                  controller: emailCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingrese su mail porfavor";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Ingrese un mail valido por favor";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: PasswordInput(
                    controller: passwordCtrl,
                    hintText: 'Ingrese una contraseña',
                    label: 'Ingrese una contraseña',
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: TextFormField(
                  controller: confirmPasswordCtrl,
                  obscureText: _confirmPasswordHidden,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: (Icon(_confirmPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off)),
                        onPressed: () {
                          setState(() {
                            _confirmPasswordHidden = !_confirmPasswordHidden;
                          });
                        },
                      ),
                      labelText: 'Confirme su contraseña',
                      hintText: 'Repita el password',
                      suffixIconColor: const Color.fromARGB(255, 0, 0, 0),
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.87), fontSize: 16.0),
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromARGB(98, 0, 238, 1)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(98, 0, 238, 1)),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Vuelva a ingresar su contraseña por favor";
                    } else if (value != passwordCtrl.text) {
                      return "La contraseñas no coiciden";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await singUp();
                      } catch (e) {
                        if (e
                            .toString()
                            .contains("email address is already in use")) {
                          showDialog(
                              //Se va a usar para mostrar errores como usuario ya registrado
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text(
                                      "Ya existe un usuario con ese email"),
                                );
                              });
                        }
                        return;
                      }
                      if (userCredential != null) {
                        // ignore: use_build_context_synchronously
                        showCircleLoader(context);

                        User? user = userCredential.user;
                        //user.uid and user.email
                        final userInDb = <String, dynamic>{
                          "id": user?.uid,
                          "email": user?.email
                        };

                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/userpreferences',
                            arguments: userInDb);
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 90, 194, 1),
                      minimumSize: const Size(175, 40)),
                  child: const Text(
                    "REGISTRARME",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future singUp() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
