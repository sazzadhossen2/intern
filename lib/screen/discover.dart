
import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  Discover({Key? key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  String? valueChoose;
  List<String> listItem = [
    'Colors',
    'Seasation',
    'category',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 80,),
               Icon(Icons.vertical_distribute),
                SizedBox(height: 20,),
                Text('Suggested',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),),
                Text('Following',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
                Text('Follower',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 50,),
          Column(
            children: [
              SizedBox(height: 80,),
              DropdownButton(
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
                value: valueChoose,
                hint: Text('Selected'),
                onChanged: (newvalue) {
                  setState(() {
                    valueChoose = newvalue as String?;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
