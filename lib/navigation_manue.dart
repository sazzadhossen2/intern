import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intern/screen/chat.dart';
import 'package:intern/screen/discover.dart';
import 'package:intern/screen/group.dart';
import 'package:intern/screen/home.dart';
import 'package:intern/screen/saved.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 final controller=Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          elevation: 0,
          height: 80,
          backgroundColor: Colors.white,
          //indicatorColor: Colors.grey,
          selectedIndex:controller.selectedIndex.value,
          onDestinationSelected: (index)=>controller.selectedIndex.value=index,
          
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Person'),
            NavigationDestination(icon: Icon(Iconsax.people), label: 'Group'),
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Discover'),
            NavigationDestination(icon: Icon(Iconsax.save_2), label: 'Save'),
            NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat'),

          ],
        ),
      ),
      body:Obx(()=> controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavController extends GetxController{
  final Rx<int>selectedIndex=0.obs;
  final screen=[
HomeScreen(),
    GroupScreen(),
    Discover(),
    SavedScreen(),
    ChatScreen(),
  ];
}