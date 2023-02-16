import "package:flutter/material.dart";
import 'package:flutter_application_1/widgets/Buttons/primary_button.dart';
import '../../widgets/Inputs/text_input.dart';

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
          // color: Theme.of(context).primaryColor,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: const Text(
                  "¡Bienvenido de nuevo!",
                  style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
              ),
              const FormRegister()
            ],
          ),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextInput(label: "Ingrese su email", hintText: "name@gmail.com", controller: emailCtrl),
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
                      hintStyle: const TextStyle(color: Colors.black, fontSize: 16),
                      labelStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.87),
                      ),
                      hintText: 'Minimo 8 caracteres',
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(98, 0, 238, 1)
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2, color: Color.fromARGB(98, 0, 238, 1)
                      ),
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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: PrimaryButton(
                  text: "INICIAR SESION",
                  onPressed: () {
                    // devolverá true si el formulario es válido, o falso si
                    // el formulario no es válido.
                    if (_formKey.currentState!.validate()) {
                      // Si el formulario es válido, queremos mostrar un Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')));
                    }
                    // print("form valido");
                    showDialog(
                        context: context,
                        builder: (context) {
                          String mailValue = emailCtrl.text;
                          String passValue = passwordCtrl.text;

                          return AlertDialog(
                            content: Text("email: $mailValue pass: $passValue"),
                          );
                        });
                  },
                ))
            ],
          ),
        ));
  }
}
