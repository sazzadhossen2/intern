import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class ProdfileController with ChangeNotifier{
  final picker=ImagePicker();
  XFile?_image;
  XFile? get imageProfile=>_image;

  Future pickGalleryImage(BuildContext context)async{
    final pickFile=await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);

    if(pickFile !=null){
      _image=XFile(pickFile.path);
      notifyListeners();
    }
  }
  Future pickCemraImage(BuildContext context)async{
    final pickFile=await picker.pickImage(source: ImageSource.camera,imageQuality: 100);

    if(pickFile !=null){
      _image=XFile(pickFile.path);
      notifyListeners();
    }
  }

  void pickImage(context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Container(
          height: 120,
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  Navigator.pop(context);
                  pickCemraImage(context);
                },
                leading: Icon(Icons.camera,),
                title: Text('Cemra'),
              ),
              ListTile(
                onTap: (){
                  Navigator.pop(context);
                  pickGalleryImage(context); 
                },
                leading: Icon(Iconsax.gallery,),
                title: Text('Gallery'),
              ),
            ],
          ),
        ),
      );
    });
  }
}