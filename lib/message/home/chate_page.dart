// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intern/message/chat_service/chat_service.dart';
// import 'package:intern/message/components/text_fild.dart';
//
// class ChatPage extends StatefulWidget {
//   ChatPage({super.key,
//     required this.receiverUserEmail,
//     required this.receiverUserID});
//
//   final String receiverUserEmail;
//   final String receiverUserID;
//
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final TextEditingController _messageController = TextEditingController();
//   final ChatService _chatService = ChatService();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   void sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       await _chatService.sendMessage(
//           widget.receiverUserID, _messageController.text);
//       _messageController.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.receiverUserEmail),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _buildMessageList(),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }
//
//   ///buld message list
//   Widget _buildMessageList() {
//     return StreamBuilder(
//         stream: _chatService.getMessages(widget.receiverUserID, _firebaseAuth.currentUser!.uid),
//
//         builder: (context,snapshot){
//           if(snapshot.hasError){
//             return Text('error${snapshot.error}');
//           }
//           if(snapshot.connectionState==ConnectionState.waiting){
//             return Text('Loading..');
//           }
//           return ListView(
//             children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
//           );
//         }
//
//     );
//   }
//
//
//   ///build message item
//   Widget _buildMessageItem(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//
//     var aligenment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
//         ? Alignment.centerRight
//         : Alignment.centerLeft;
//
//     return Container(
//       alignment: aligenment,
//       child: Column(
//         children: [
//           Text(data['senderEmail']),
//           Text(data['message'])
//         ],
//       ),
//     );
//   }
//
//   ///build message input
//   Widget _buildMessageInput() {
//     return Row(
//       children: [
//         MytextFild(
//             controller: _messageController,
//             hintText: 'Enter message',
//             obscureText: false)
//       ],
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/message/chat_service/chat_bubble.dart';
import 'package:intern/message/chat_service/chat_service.dart';
import 'package:intern/message/components/text_fild.dart';

class ChatPage extends StatefulWidget {
  ChatPage(
      {Key? key, required this.receiverUserEmail, required this.receiverUserID})
      : super(key: key);

  final String receiverUserEmail;
  final String receiverUserID;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  /// build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Use ListView.builder for better performance
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return _buildMessageItem(snapshot.data!.docs[index]);
          },
        );
      },
    );
  }

  /// build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            Text(data['sendEmail']),
            ChatBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

  /// build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: MytextFild(
            controller: _messageController,
            hintText: 'Enter message',
            obscureText: false,
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: sendMessage,
        ),
      ],
    );
  }
}
