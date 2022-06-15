import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_mobil_form.dart';
import 'image_processing.dart';

class details extends StatelessWidget {
  const details({
    Key? key,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.detail,
    required this.docName,
  }) : super(key: key);

  final String nama;
  final String harga;
  final String gambar;
  final String detail;
  final String docName;

  @override
  Widget build(BuildContext context) {
    var tinggiukuran = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nama,
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Anton",
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff9DC0BC),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Yakin Ingin Hapus?",
                middleText: "",
                textConfirm: "Hapus",
                textCancel: "Batalkan",
                buttonColor: Color(0xff9DC0BC),
                cancelTextColor: Color(0xff9DC0BC),
                confirmTextColor: Colors.white,
                onConfirm: () async {
                  await FirebaseFirestore.instance
                      .collection("mobil")
                      .doc(docName)
                      .delete();
                  await FirebaseStorage.instance.ref().child(gambar).delete();

                  Get.back(canPop: true);
                },
              );
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
              onPressed: () {
                Get.to(() => EditMobilFormPage(docName: docName));
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: FutureBuilder(
              future: ImageProcessing.imageURL(gambar),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Image.network(snapshot.data!);
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return Container();
              },
            ),
          ),
          ListView(
            padding: EdgeInsets.only(top: tinggiukuran / 3),
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: tinggiukuran / 1.5,
                ),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color(0xff9DC0BC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nama,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Anton",
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          harga,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Anton",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      detail,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Anton",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
