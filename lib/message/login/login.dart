// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intern/message/components/myButton.dart';
// import 'package:intern/message/components/text_fild.dart';
// import 'package:intern/message/service/auth_service.dart';
// import 'package:intern/message/signup/signUp.dart';
// import 'package:provider/provider.dart';
//
// class Login extends StatelessWidget {
//   Login({super.key, this.onTap});
//
//   final void Function()? onTap;
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   void signIn() async {
//     final authService = Provider.of<AuthService>(context, listen: false);
//
//     try {
//       await authService.signWithEmailPassword(
//           emailController.text, passwordController.text);
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.toString())));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//
//               ///logo
//               Icon(
//                 Icons.message,
//                 size: 80,
//                 color: Colors.grey,
//               ),
//
//               ///Welcome back
//               Text(
//                 'Welcome back you\'ve been missed',
//                 style: TextStyle(fontSize: 16),
//               ),
//
//               ///email
//               MytextFild(
//                   controller: emailController,
//                   hintText: 'email',
//                   obscureText: false),
//               SizedBox(
//                 height: 25,
//               ),
//
//               ///password
//               MytextFild(
//                   controller: passwordController,
//                   hintText: 'password',
//                   obscureText: false),
//               SizedBox(
//                 height: 25,
//               ),
//
//               MyButton(
//                 text: 'Sign in',
//                 onTap: signIn,
//               ),
//
//               SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Not a member? '),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   InkWell(
//                     onTap: onTap,
//                     child: Text(
//                       'Redister Now',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/message/components/myButton.dart';
import 'package:intern/message/components/text_fild.dart';
import 'package:intern/message/service/auth_service.dart';
import 'package:intern/message/signup/signUp.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key, this.onTap});

  final void Function()? onTap;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signWithEmailPassword(
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

              ///Welcome back
              Text(
                'Welcome back you\'ve been missed',
                style: TextStyle(fontSize: 16),
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

              MyButton(
                text: 'Sign in',
                onTap: () => signIn(context),
              ),

              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member? '),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: onTap,
                    child: Text(
                      'Register Now',
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
