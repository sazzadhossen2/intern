import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intern/screen/chat.dart';
import 'package:intern/screen/chat_screen/chat_screen.dart';

class GroupScreen extends StatelessWidget {
   GroupScreen({Key? key}) : super(key: key);
  List categories = [
    'Flutter Group',
    'KKg Group',
    'Address group',
    'IPL 2024',
    'IPL 2023',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(width: 2, color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey
                    ),
                      child: Icon(Iconsax.add)
                  ),
                  title: Text('Creat A group',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('Exisiting Group',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

            Expanded(
              child: ListView.separated(itemBuilder: (context,index){
                return Card(
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>ChatScreens());
                    },
                    child: ListTile(
                      leading:  CircleAvatar(
                        backgroundImage: AssetImage('assets/profile/review_profile_image_1.jpg',),
                      ),

                      title: Text(categories[index],style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),),
                      subtitle: Text("Hlow every one"),
                    ),
                  ),
                );
              }, separatorBuilder: (context,index){
                return SizedBox(width: 10,);
              }, itemCount: 5),
            )



            
          ],
        ),
      ),
    );
  }
}
