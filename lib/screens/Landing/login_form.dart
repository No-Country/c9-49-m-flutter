import "package:flutter/material.dart";
import 'package:flutter_application_1/widgets/primary_button.dart';
import '../../widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "¡Bienvenido de nuevo!",
                style: TextStyle(fontSize: 35, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              FormLogin()
            ],
          ),
        ),
      ),
    );
  }
}

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  // static const snackBar = SnackBar(
  //   content: Text('Yay! A SnackBar!'),
  // );

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool _passwordHidden = true;

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordHidden = true;
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
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: InputField(
                  label: "Ingrese su email", 
                  controller: emailCtrl,
                  hintText: "chat_lingo@gmail.com",
                  validation: (value) {
                    if (value!.isEmpty) return "Please enter some text";
                    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)
                    )  {
                      return "Ingrese un email valido porfavor";
                    }
                    return null;
                  },
                )
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextFormField(
                  controller: passwordCtrl,
                  obscureText: _passwordHidden,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: (Icon(_passwordHidden
                            ? Icons.visibility
                            : Icons.visibility_off)),
                        onPressed: () {
                          setState(() {
                            _passwordHidden = !_passwordHidden;
                          });
                        },
                      ),
                      suffixIconColor: const Color.fromARGB(255, 0, 0, 0),
                      labelText: 'Ingrese un password',
                      hintStyle: const TextStyle(color: Colors.black),
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      hintText: 'Minimo 8 caracteres',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: PrimaryButton(
                  text: "INICIAR SESION",
                  onPressed: () {
                    // devolverá true si el formulario es válido, o falso si
                    // el formulario no es válido.
                    if (_formKey.currentState!.validate()) {
                      // Si el formulario es válido, queremos mostrar un Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                    print("form valido");
                    showDialog(
                        context: context,
                        builder: (context) {
                          String mailValue = emailCtrl.text;
                          String passValue = passwordCtrl.text;

                          return AlertDialog(
                            content: Text("email: $mailValue pass: $passValue"),
                          );
                        });
                  }
                )
              )
            ],
          ),
        ));
  }
}
