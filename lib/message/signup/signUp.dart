import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/message/components/myButton.dart';
import 'package:intern/message/components/text_fild.dart';
import 'package:intern/message/login/login.dart';
import 'package:intern/message/service/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.onTap});

  final void Function()? onTap;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmConterooler = TextEditingController();

  void signUp(BuildContext context) async {
    if (passwordController.text != ConfirmConterooler.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('password not match')));
      return;
    }

    ///get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signupEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),

              ///logo
              Icon(
                Icons.message,
                size: 80,
                color: Colors.grey,
              ),
              SizedBox(
                height: 50,
              ),

              ///Welcome back
              Text(
                'Lets Creat account',
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(
                height: 25,
              ),

              ///email
              MytextFild(
                  controller: emailController,
                  hintText: 'email',
                  obscureText: false),
              SizedBox(
                height: 25,
              ),

              ///password
              MytextFild(
                  controller: passwordController,
                  hintText: 'password',
                  obscureText: false),
              SizedBox(
                height: 25,
              ),
              MytextFild(
                  controller: ConfirmConterooler,
                  hintText: 'Confirm password',
                  obscureText: false),
              SizedBox(
                height: 25,
              ),
              MyButton(
                text: 'Sign up',
                onTap: () => signUp(context),
              ),

              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a memebr? '),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login Now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
