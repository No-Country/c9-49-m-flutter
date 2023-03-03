import "package:flutter/material.dart";
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/theme/colors_theme.dart';
import 'package:flutter_application_1/widgets/Loaders/circle_loader.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

// Services:
import '../../services/auth_service.dart';
import '../../services/user_service.dart';
import '../../services/connect_user.dart';

// Screens:
import './forgot_pw_screen.dart';
import './welcome_screen.dart';

// Widgets:
import '../../widgets/Inputs/email_input.dart';
import "../../widgets/Inputs/password_input.dart";
import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/Buttons/google_button.dart';
import '../../widgets/Modals/errors_preferences_modal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).colorScheme.background;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(20.0)),
                      overlayColor:
                          MaterialStateProperty.all<Color>(backgroundColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(backgroundColor),
                      elevation: MaterialStateProperty.all(0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "REGISTRARSE",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary),
                  )))
        ],
        iconTheme: const IconThemeData(color: LightModeColors.blackColor),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
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
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    //  Login function
    Future<void> signIn() async {
      try {
        User? loggedUser = await _authService.loginWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (loggedUser != null) {
          final userInDB =
              await _userService.findById(uid: loggedUser.uid.toString());
          showCircleLoader(context);
          await connectUserToChat(
              userInDB: userInDB, client: stream.StreamChat.of(context).client);

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WelcomeScreen(userInDB: userInDB);
          }));
        }
      } on FirebaseAuthException catch (e) {
        print(e);
        showErrorDialog(context,
            titleText: "Upps!",
            descriptionText: "Usuario o contraseña incorrectos");
      }
    }

    return Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 36.0),
        child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '¡Te damos la bienvenida!',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 34.0,
                    ),
                    Center(
                      child: Container(
                        width: 155,
                        height: 94,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logos/logo.png'))),
                      ),
                    ),
                    const SizedBox(
                      height: 56.0,
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ForgotPasswordScreen();
                        }));
                      },
                      child: const Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: PrimaryButton(
                          text: "INICIAR SESION",
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await signIn();
                            }
                          }),
                    ),
                  ],
                ),
              ],
            )));
  }
}
