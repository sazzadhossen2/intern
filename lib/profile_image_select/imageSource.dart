import 'package:image_picker/image_picker.dart';

PickImage(ImageSource source)async{
  final ImagePicker _imagePiker =ImagePicker();
  XFile ?_file=await _imagePiker.pickImage(source: source);
  if(_file!=null){
    return await _file.readAsBytes();
  }
}