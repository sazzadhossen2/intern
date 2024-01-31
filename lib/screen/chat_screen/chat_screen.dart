
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
class ChatScreens extends StatelessWidget {
  const ChatScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ListTile(
          leading:  CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png',),
          ),
          title: Text('Flutter Group',style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),),
        ),
        actions: [
          Icon(Iconsax.call),
          SizedBox(width: 10,),
          Icon(Iconsax.video),
          SizedBox(width: 10,),
        ],
      ),
    //      bottomNavigationBar: Obx(
    //     ()=> NavigationBar(
    //   elevation: 0,
    //   height: 80,
    //   backgroundColor: Colors.white,
    //   indicatorColor: Colors.grey,
    //  // selectedIndex:controller.selectedIndex.value,
    //  // onDestinationSelected: (index)=>controller.selectedIndex.value=index,
    //
    //   destinations: [
    //     NavigationDestination(icon: Icon(Iconsax.user), label: 'Person'),
    //     NavigationDestination(icon: Icon(Iconsax.people), label: 'Group'),
    //     NavigationDestination(icon: Icon(Iconsax.home), label: 'Discover'),
    //     NavigationDestination(icon: Icon(Iconsax.save_2), label: 'Save'),
    //     NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat'),
    //
    //   ],
    // ),
    // ),
    //body:Obx(()=> controller.screen[controller.selectedIndex.value]), ,
    );
  }
}
