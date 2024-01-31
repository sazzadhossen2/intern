import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/message/home/home.dart';
import 'package:intern/message/service/auth.dart';

import '../../navigation_manue.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return HomePageMes();
          }
          else{
            return LoginOrRegisTation();
          }
        },
      ),
    );
  }
}
