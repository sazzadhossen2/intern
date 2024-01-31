import 'package:flutter/cupertino.dart';
import 'package:intern/message/login/login.dart';
import 'package:intern/message/signup/signUp.dart';

class LoginOrRegisTation extends StatefulWidget {
  LoginOrRegisTation({super.key});

  @override
  State<LoginOrRegisTation> createState() => _LoginOrRegisTationState();
}

class _LoginOrRegisTationState extends State<LoginOrRegisTation> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(
        onTap: togglePage,
      );
    } else {
      return RegisterPage(
        onTap: togglePage,
      );
    }
  }
}
