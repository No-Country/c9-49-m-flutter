import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";

//Steps
import "package:flutter_application_1/screens/Onboarding/Steps/lang_level_step.dart";
import "package:flutter_application_1/screens/Onboarding/Steps/native_lang_step.dart";
import "package:flutter_application_1/screens/Onboarding/Steps/personal_info_step.dart";
import "package:flutter_application_1/screens/Onboarding/Steps/target_lang_step.dart";
import "package:flutter_application_1/screens/Onboarding/Steps/user_description_step.dart";
import "package:flutter_application_1/screens/Onboarding/Steps/user_hobbies_step.dart";
import "package:flutter_application_1/utils/userdata.utils.dart";

import "../../types/user_form_data.dart";

class MyFormWidget extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  const MyFormWidget({Key? key}) : super(key: key);

  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final formKey = GlobalKey<FormState>();
  final formData = UserFormData();
  final pageController = PageController(initialPage: 0);
  List<String> hobbies = [];
  var db = FirebaseFirestore.instance;
  Map<String, dynamic> arguments = {};

  @override
  void initState() {
    super.initState();

    // obtener argumentos de la ruta
  }

  Future<void> saveFormData() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final name = formData.name;
      final born = formData.born;
      final gender = formData.gender;
      final nativeLanguage = formData.nativeLanguage;
      final targetLanguage = formData.targetLanguage;
      final levelTarget = formData.levelTarget;
      final userDescription = formData.userDescription;
      final hobbies = formData.hobbies;

      final newUser = {
        "first": name,
        "born": born,
        "gender": gender,
        "nativeLanguage": nativeLanguage,
        "targetLanguage": targetLanguage,
        "levelTarget": levelTarget,
        "userDescription": userDescription,
        "hobbies": hobbies,
        "image": UserDataUtils.getUserImage(name)
      };

      await db
          .collection("users")
          .doc(arguments['id'])
          .set({...newUser, ...arguments}).then((value) => {
                // ignore: avoid_print
                print("Document added"),
                MyFormWidget.navigatorKey.currentState?.pushNamed(
                  '/login',
                )
              });
    }
  }

  void onChangeGender(value) {
    setState(() {
      formData.gender = value;
    });
  }

  void onChangeBorn(value) {
    setState(() {
      formData.born = value;
    });
  }

  void onChangeNativeLanguage(value) {
    setState(() {
      formData.nativeLanguage = value;
    });
  }

  void onChangeTargetLanguage(value) {
    setState(() {
      formData.targetLanguage = value;
    });
  }

  void onChangeLevelTargetLang(value) {
    setState(() {
      formData.levelTarget = value;
    });
  }

  void onChangeHobbie(value) {
    setState(() {
      if (formData.hobbies == null) {
        List<String> arr = [value];
        formData.hobbies = arr;
        return;
      }
    });
    if (formData.hobbies!.any((element) => element == value)) {
      setState(() {
        formData.hobbies?.remove(value);
      });
    } else {
      setState(() {
        formData.hobbies?.add(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            PersonalInfoStep(
              formData: formData,
              pageController: pageController,
              onChangeGender: onChangeGender,
              onChangeBorn: onChangeBorn,
            ),
            NativeLangStep(
                formData: formData,
                pageController: pageController,
                onChangeNativeLanguage: onChangeNativeLanguage),
            TargetLangStep(
              formData: formData,
              pageController: pageController,
              onChangeTargetLanguage: onChangeTargetLanguage,
            ),
            LangLevelStep(
                formData: formData,
                pageController: pageController,
                onChangeLevelTargetLang: onChangeLevelTargetLang),
            UserDecriptionStep(
              formData: formData,
              pageController: pageController,
            ),
            UserHobbiesStep(
                formData: formData,
                pageController: pageController,
                onChangeHobbie: onChangeHobbie,
                saveFormData: saveFormData)
          ],
        ),
      ),
    );
  }
}
