import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "../../widgets/form_input.dart";

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
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
              child: Text("Iniciar sesión"))
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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
  var userCredential;

  final _formKey = GlobalKey<FormState>();
  // static const snackBar = SnackBar(
  //   content: Text('Yay! A SnackBar!'),
  // );

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
                  decoration: InputDecoration(
                      labelText: 'Ingrese su nombre',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'Chat Lingo',
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                  controller: nameCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Ingrese su mail',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      hintText: 'chat_lingo@gmail.com',
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                  controller: emailCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter some text";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Ingrese un mail valido porfavor";
                    }
                    return null;
                  },
                ),
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
                        borderSide: BorderSide(
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
                      suffixIconColor: const Color.fromARGB(255, 0, 0, 0),
                      labelText: 'Confirme el password',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      hintText: 'Repita el password',
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: const OutlineInputBorder(
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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // devolverá true si el formulario es válido, o falso si
                    // el formulario no es válido.
                    if (_formKey.currentState!.validate()) {
                      // Si el formulario es válido, queremos mostrar un Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')));
                      await singUp();
                      if (userCredential != null) {
                        print(userCredential);
                        User? user = userCredential.user;
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(
                          context,
                          '/register/preferences',
                          arguments: {'user': user},
                        );
                      }
                    }
                    showDialog(
                        //Se va a usar para mostrar errores como usuario ya registrado
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Bienvenido a Speak Easy"),
                          );
                        });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 90, 194, 1),
                      minimumSize: const Size(200, 50)),
                  child: const Text("Registrarme"),
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
      print(e);
    }
  }
}
