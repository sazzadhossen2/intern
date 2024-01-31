

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intern/message/service/auth_service.dart';
import 'package:provider/provider.dart';

import 'chate_page.dart';

class HomePageMes extends StatefulWidget {
  HomePageMes({super.key});

  @override
  State<HomePageMes> createState() => _HomePageMesState();
}

class _HomePageMesState extends State<HomePageMes> {
  final FirebaseAuth _auths = FirebaseAuth.instance;

  void signOut(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.SignOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          title: Text(
            'Flutter Group',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          const Icon(Iconsax.call),
          const SizedBox(
            width: 10,
          ),
          const Icon(Iconsax.video),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () => signOut(context), // pass a callback here
            icon: const Icon(Iconsax.logout),
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading..');
          }
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildUserListItem(doc))
                .toList(),
          );
        });
  }

  ///building individual user list item
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    ///display all user except current user
    if (_auths.currentUser!.email != data['email']) {
      return ListTile(
        title:Text(data['email']),
        onTap: () {
          Get.to(() => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: data['uid'],
              ));
        },
      );
    }else{
      return Container();
    }
  }
}
