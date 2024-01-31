import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String sendId;
  final String sendEmail;
  final String recevierId;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.timestamp,
      required this.message,
      required this.recevierId,
      required this.sendEmail,
      required this.sendId});

  Map<String, dynamic> toMap() {
    return {
      'sendId': sendId,
      'sendEmail': sendEmail,
      'recevierId': recevierId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
