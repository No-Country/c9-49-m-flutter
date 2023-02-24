import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/Inputs/email_input.dart';
import '../../widgets/Buttons/primary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Ya puedes revisar tu email!"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        alignment: Alignment.center,
        child: Column(children: [
          const Text(
            "Escribe tu email y te enviaremos un link para que puedas cambiar tu contraseña",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20.0,
          ),
          EmailInput(
              label: "Email",
              hintText: "nombre@gmail.com",
              controller: emailController),
          const SizedBox(
            height: 20.0,
          ),
          PrimaryButton(text: "Reset password", onPressed: passwordReset)
        ]),
      ),
    );
  }
}
