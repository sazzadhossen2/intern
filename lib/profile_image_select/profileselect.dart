import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intern/profile_image_select/imageSource.dart';

class Profileselect extends StatefulWidget {
   Profileselect({super.key});

  @override
  State<Profileselect> createState() => _ProfileselectState();
}

class _ProfileselectState extends State<Profileselect> {
  Uint8List?_uint8list;

void SelectedImage()async{
  Uint8List img =await PickImage(ImageSource.camera);

  setState(() {
    _uint8list=img;
  });

}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: SelectedImage,
      child:_uint8list!=null?CircleAvatar(
        radius: 46,
        backgroundImage: MemoryImage(_uint8list!),
      ):

      CircleAvatar(
        radius: 64,
        backgroundImage:
          AssetImage(
            'assets/profile/review_profile_image_1.jpg',
        ),
      ),
    );
  }
}
