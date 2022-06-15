import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobilTextController extends GetxController {
  var filePath = "".obs;
  var fileName = "".obs;

  var jenis = "Ferrari".obs;
  List<String> jenisList = ["Ferrari", "Lamborghini", "BMW"];

  File get file {
    return File(filePath.value);
  }

  void fill(String docName) async {
    await FirebaseFirestore.instance
        .collection("mobil")
        .doc(docName)
        .get()
        .then((value) {
          namaController.text = value.get("nama");
          warnaController.text = value.get("warna");
          hargaController.text = value.get("harga");
          detailController.text = value.get("detail");
          jenis.value = value.get("jenis");
        });
  }

  final namaController = TextEditingController();
  final warnaController = TextEditingController();
  final hargaController = TextEditingController();
  final detailController = TextEditingController();
}
