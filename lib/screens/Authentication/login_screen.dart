import "package:flutter/material.dart";
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

// Services:
import '../../services/auth_service.dart';
import '../../services/init_stream_chat.dart';

// Screens:
import './forgot_pw_screen.dart';
import '../Home/home_screen.dart';

// Widgets:
import '../../widgets/Inputs/email_input.dart';
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
    final formKey = GlobalKey<FormState>();

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
          await initStreamChat(
              firebaseUser: user,
              // ignore: use_build_context_synchronously
              client: stream.StreamChat.of(context).client);

          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen(user: user);
          }));
        }
      } on FirebaseAuthException catch (e) {
        print(e);
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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTitle(text: "¡Bienvenido otra vez!"),
              const SizedBox(
                height: 50.0,
              ),
              EmailInput(
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
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ForgotPasswordScreen();
                  }));
                },
                child: const Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Container(
                alignment: Alignment.center,
                child: PrimaryButton(
                    text: "INICIAR SESION",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                        await signIn();
                      }
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
        ));
  }
}
