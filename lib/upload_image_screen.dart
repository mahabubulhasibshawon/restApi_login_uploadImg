import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if(pickedFile != null){
      image = File(pickedFile.path);
      setState(() {
      });
    }
    else{
      print('no image');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: image == null
                ? Center(
              child: Text('pick image'),
            )
                : Container(child: Center(
              child: Image.file(
                File(image!.path).absolute,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),),
          )
        ],
      ),
    );
  }
}
