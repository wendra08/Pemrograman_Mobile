import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxTextController extends GetxController {
  var nama = "".obs;
  var ttl = "".obs;
  var alamat = "".obs;
  var agama = "".obs;
  var gender = "".obs;
  var tampilOutput = false.obs;

  List<String> genderList = ["Laki - Laki", "Perempuan"];

  final namaController = TextEditingController();
  final ttlController = TextEditingController();
  final alamatController = TextEditingController();
  final agamaController = TextEditingController();
}