import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class AddImageText extends StatelessWidget {
  AddImageText({super.key});

  String imageurl = '';
  TextEditingController _brandName=TextEditingController();
CollectionReference _reference=FirebaseFirestore.instance.collection('internship');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Center(
                child: IconButton(
                    onPressed: () async {
                      ImagePicker imagepicer = ImagePicker();
                      XFile? file = await imagepicer.pickImage(
                          source: ImageSource.camera);
                      print('${file?.path}');

                      if (file == null) return;

                      ///image dart code
                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      Reference reference = FirebaseStorage.instance.ref();
                      Reference referenceDirImages = reference.child('images');

                      Reference referenceImageToUpload =
                          referenceDirImages.child(uniqueFileName);

                      ///Store the file
                      try {
                      await  referenceImageToUpload.putFile(File(file!.path));

                        ///success
                       imageurl=await referenceImageToUpload.getDownloadURL();
                      } catch (error) {}
                    },
                    icon: Icon(
                      Iconsax.camera,
                    ))),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _brandName,
              decoration: InputDecoration(
                hintText: 'Enter Deails',
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
// if(imageurl.isEmpty){
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Upload Image')));
// }

                      String itemName=_brandName.text;
                      Map<String,String>dataToSend={
                        'internsh':itemName,
                        'image':imageurl
                      };
                      _reference.add(dataToSend);
                      print(_reference.add(dataToSend));
                      print(itemName);
                      print(dataToSend);
                    },
                    child: Text('Save')))
          ],
        ),
      ),
    );
  }
}
