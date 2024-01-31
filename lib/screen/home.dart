import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern/screen/add_image_text/addad_image_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) {
    _stream = _reference.snapshots();
  }

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('internship');
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                          backgroundImage: AssetImage(
                            'assets/profile/review_profile_image_1.jpg',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Raffat Arfeen',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text('Raffar402')
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'My Closet',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                //margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: InkWell(
                                    onTap: () {
                                      Get.to(() => AddImageText());
                                    },
                                    child: Icon(Icons.add)),
                              ),
                            ),
                          ),
                          Text(
                            'Add New',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(width: 10,)
                ],
              ),
            ),


            StreamBuilder<QuerySnapshot>(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  QuerySnapshot? querysnapShot = snapshot.data;
                  List<QueryDocumentSnapshot> document =
                      querysnapShot?.docs ?? [];

                  List<Map> items = document
                      .map((e) => e.data() as Map
                          )
                      .toList();

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      Map thisItem = items[index];
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${thisItem['internsh']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              ClipRRect(
                                  child: thisItem.containsKey('image')
                                      ? Image.network(
                                          '${thisItem['image']}',
                                          height: 132,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                      : Container())
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return CircularProgressIndicator(); // Add a loading indicator if needed
              },
            ),

          ],
        ),
      ),
    );
  }
}
