import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List categories = [
    'Shope',
    'jins',
    'Shart',
    'Mobile',
    'Watch',
    'T shart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(
                         height: 70,
                         width: 70,
                         child: CircleAvatar(
                           backgroundImage: AssetImage('assets/profile/review_profile_image_1.jpg',),
                         ),
                       ),
                       SizedBox(height: 2,),
                       Text('Raffat Arfeen',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                       Text('Raffar402')
                     ],
                   ),
                  
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('My Closet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              //margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                          Text('Add New',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),

                        ],
                      ),

                    ],
                  ),
                 // SizedBox(width: 10,)
                ],
              ),

            ),
           // SizedBox(height: 20,),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ClipRRect(
                            //borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/s-l1600.jpg',
                              fit: BoxFit.cover,
                              height: 132,
                              width: double.infinity,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
