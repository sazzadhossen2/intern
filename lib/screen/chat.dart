import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  List categories = [
    'Shamim',
    'Sazzad',
    'Ariful',
    'Adnan',
    'Sfafin',

  ];
  List subtitel=[
    'Whats up',
    'How Are You',
    'Hlow',
    'Hlow i am flutter Developer',
    'Where are you From'
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
            Row(
              children: [
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.vertical_distribute),
                  title: Text('Chat',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
              ),
                IconButton(onPressed: (){}, icon:Icon(Icons.border_color_outlined))
            ],), 
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
            Expanded(
              child: ListView.separated(itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading:  CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png',),
                    ),

                    title: Text(categories[index],style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                    subtitle: Text(subtitel[index]),
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
