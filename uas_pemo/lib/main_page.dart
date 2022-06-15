import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_mobil_form.dart';
import 'details.dart';
import 'image_processing.dart';

class MainPage extends StatelessWidget {
  Widget kotak(
      //method yang mereturn widget kotak
      {required double lebar, // parameter
      required String teks1,
      required String teks2,
      required String harga,
      required String gambar,
      required BuildContext context}) {
    return SizedBox(
      width: lebar, // lebar ukuran container
      height: 170,
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20), // jarak dalam
          // tinggi ukuran container
          decoration: BoxDecoration(
            color: Color(0xff9DC0BC), //warna background
          ),
          child: Row(
            // untuk membuat baris
            children: [
              Flexible(
                //widget yg menyesuaikan ukuran sesuai dengan parrent
                fit: FlexFit.tight,
                flex: 1, // untuk perbandingan ukuran dengan flexible lain
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceAround, // untuk memberi jarak vertical
                    crossAxisAlignment: CrossAxisAlignment.start, // horizontal
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, //horizontal
                        children: [
                          Text(
                            teks1,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Anton",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            teks2,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Noto",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        harga,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Noto",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  child: FutureBuilder(
                    future: ImageProcessing.imageURL(gambar),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
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
                  // child: Image.asset(gambar),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var lebarukuran = MediaQuery.of(context).size.width;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference mobil = firestore.collection("mobil");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Get.toNamed("/satu");
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
          title: Text(
            'I\'m Here',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Anton",
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff9DC0BC),
          bottom: TabBar(
            tabs: [
              Tab(text: "Ferrari"),
              Tab(text: "Lamborghini"),
              Tab(text: "BMW"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff9DC0BC),
          onPressed: () {
            Get.to(() => AddMobilFormPage());
          },
          child: const Icon(Icons.add_circle_outline),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: mobil.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var filtered = snapshot.data!.docs
                      .where((e) => e.get("jenis") == "Ferrari");
                  return ListView(
                      children: filtered.map((e) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => details(
                            nama: e.get("nama"),
                            harga: e.get("harga"),
                            gambar: e.get("gambar"),
                            detail: e.get("detail"),
                            docName: e.id,
                          ),
                        );
                      },
                      child: kotak(
                        lebar: lebarukuran,
                        teks1: e.get("nama"),
                        teks2: e.get("warna"),
                        harga: e.get("harga"),
                        gambar: e.get("gambar"),
                        context: context,
                      ),
                    );
                  }).toList());
                }
                return const CircularProgressIndicator();
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: mobil.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var filtered = snapshot.data!.docs
                      .where((e) => e.get("jenis") == "Lamborghini");
                  return ListView(
                      children: filtered.map((e) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => details(
                            nama: e.get("nama"),
                            harga: e.get("harga"),
                            gambar: e.get("gambar"),
                            detail: e.get("detail"),
                            docName: e.id,
                          ),
                        );
                      },
                      child: kotak(
                        lebar: lebarukuran,
                        teks1: e.get("nama"),
                        teks2: e.get("warna"),
                        harga: e.get("harga"),
                        gambar: e.get("gambar"),
                        context: context,
                      ),
                    );
                  }).toList());
                }
                return const CircularProgressIndicator();
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: mobil.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var filtered =
                      snapshot.data!.docs.where((e) => e.get("jenis") == "BMW");
                  return ListView(
                      children: filtered.map((e) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => details(
                            nama: e.get("nama"),
                            harga: e.get("harga"),
                            gambar: e.get("gambar"),
                            detail: e.get("detail"),
                            docName: e.id,
                          ),
                        );
                      },
                      child: kotak(
                        lebar: lebarukuran,
                        teks1: e.get("nama"),
                        teks2: e.get("warna"),
                        harga: e.get("harga"),
                        gambar: e.get("gambar"),
                        context: context,
                      ),
                    );
                  }).toList());
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
