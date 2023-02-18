import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Services
import '../../services/auth_service.dart';

// Widgets:
import "../../widgets/Inputs/text_input.dart";
import "../../widgets/Inputs/password_input.dart";
import "../../widgets/Texts/title.dart";
import '../../widgets/Buttons/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    //  Login function
    Future<void> signIn() async {
      try {
        User? user = await _authService.loginWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (user != null) {
          Navigator.pushNamed(context, '/onboarding');
        }
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Text("Usuario o contraseña incorrectos"),
          ),
        );
      }
    }

    Future<void> signInWithGoogle() async {
      try {
        User? user = await _authService.loginWithGoogle();
        if (user != null) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              content: Text("Logueado con google"),
            ),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Text("No se pudo conectar con Google"),
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTitle(text: "¡Bienvenido otra vez!"),
          const SizedBox(
            height: 50.0,
          ),
          TextInput(
              label: "Email",
              hintText: "example@gmail.com",
              controller: emailController),
          const SizedBox(
            height: 15.0,
          ),
          PasswordInput(
            label: "Contraseña",
            hintText: "Minimo 8 caracteres",
            controller: passwordController,
          ),
          const SizedBox(
            height: 18.0,
          ),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                          content: Text("Cambiando contraseña"),
                        ));
              },
              child: const Text(
                "¿Olvidaste tu contraseña?",
                style: TextStyle(color: Colors.blue),
              )),
          const SizedBox(
            height: 32.0,
          ),
          Container(
            alignment: Alignment.center,
            child: PrimaryButton(
                text: "INICIAR SESION",
                onPressed: () async {
                  await signIn();
                }),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Container(
            alignment: Alignment.center,
            child: PrimaryButton(
                text: "GOOGLE",
                onPressed: () async {
                  await signInWithGoogle();
                }),
          )
        ],
      ),
    );
  }
}
