import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_controller/mobil_text_controller.dart';
import 'image_processing.dart';

class AddMobilFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MobilTextController tc = Get.put(MobilTextController());
    var lebarukuran = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9DC0BC),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Tambahkan Mobil",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Anton",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => (tc.filePath.value.isNotEmpty)
                        ? Image.file(tc.file)
                        : Container(),
                  ),
                  SizedBox(
                    height: 50,
                    width: lebarukuran,
                    child: ElevatedButton(
                      onPressed: () async {
                        final results = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.image,
                        );

                        tc.filePath.value = results!.files.single.path!;
                        tc.fileName.value = results.files.single.name;
                      }, //untuk primary
                      child: Text("Upload Gambar"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: tc.namaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Masukkan Nama",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: tc.warnaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Masukkan Warna",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: tc.hargaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Masukkan Harga ",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (var item in tc.jenisList)
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            activeColor: Colors.white,
                            value: item,
                            groupValue: tc.jenis.value,
                            onChanged: (v) {
                              tc.jenis.value = v.toString();
                            },
                          ),
                        ),
                        Text(
                          item,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 4,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: tc.detailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Masukkan Detail",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: lebarukuran,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (tc.filePath.value.isEmpty) {
                          return;
                        }
                        await ImageProcessing.uploadImage(
                            tc.filePath.value, tc.fileName.value);
                        await FirebaseFirestore.instance
                            .collection("mobil")
                            .add({
                          "nama": tc.namaController.text,
                          "warna": tc.warnaController.text,
                          "jenis": tc.jenis.value,
                          "detail": tc.detailController.text,
                          "harga": tc.hargaController.text,
                          "gambar": "mobil/${tc.fileName.value}",
                        });

                        Get.back();
                      }, //untuk primary
                      child: Text("Tambahkan"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
