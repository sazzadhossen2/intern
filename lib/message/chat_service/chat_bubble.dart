import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({super.key, required this.message});
 final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.shade500
      ),child: Text(message,style: TextStyle(fontSize: 16,color: Colors.white),),
    );
  }
}
