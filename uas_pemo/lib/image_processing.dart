import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ImageProcessing {
  static Future<String> imageURL(String gambar) async {
    String imageURL =
        await FirebaseStorage.instance.ref().child(gambar).getDownloadURL();
    return imageURL;
  }

  static Future<void> uploadImage(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await FirebaseStorage.instance.ref("mobil/$fileName").putFile(file);
    } on FirebaseException {
    }
  }
}
