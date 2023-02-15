import "package:flutter/material.dart";
import '../../widgets/input_field.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¡Estamos felices de que seas parte!",
                style: TextStyle(fontSize: 35, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              FormRegister()
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
  static const snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  bool _passwordHidden = true;
  bool _confirmPasswordHidden = true;

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordHidden = true;
    _confirmPasswordHidden = true;
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
                  label: "Ingrese su nombre", 
                  controller: nameCtrl, 
                  hintText: "Jon Doe",
                  validation: (value) {
                    if (value!.isEmpty) {
                      return "Este campo no puede estar vacío";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: InputField(
                  label: "Ingrese su mail", 
                  controller: nameCtrl, 
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
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                      suffixIconColor: Color.fromARGB(255, 0, 0, 0),
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
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                      suffixIconColor: Color.fromARGB(255, 0, 0, 0),
                      labelText: 'Confirme el password',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      hintText: 'Repita el password',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter some text";
                    } else if (value != passwordCtrl.text) {
                      return "La contraseñas no coiciden";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
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
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.grey, minimumSize: Size(200, 50)),
                  child: Text("Registrarme"),
                ),
              )
            ],
          ),
        ));
  }
}
