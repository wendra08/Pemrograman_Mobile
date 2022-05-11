
import 'package:flutter/material.dart';
import 'package:tugas1_2009106056_muhammad_wendra_suryananda/form.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget kotak(
      //method yang mereturn widget kotak
      {required double lebar, // parameter
      required String teks1,
      required String teks2,
      required String harga,
      required String gambar}) {
    return Container(
      margin: EdgeInsets.all(10), //berikan jarak luar
      padding: EdgeInsets.all(20), // jarak dalam
      width: lebar, // lebar ukuran container
      height: 150, // tinggi ukuran container
      decoration: BoxDecoration(
        color: Color(0xff9DC0BC), //warna background
        borderRadius: BorderRadius.circular(20),
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
                    crossAxisAlignment: CrossAxisAlignment.start, //horizontal
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
              child: Image.asset(gambar),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var lebarukuran = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
               Navigator.pushNamed(context, '/satu');
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
        body: TabBarView(
          children: [
            ListView(
              children: [
                kotak(
                  lebar: lebarukuran,
                  teks1: "Ferrari SF90 Stradale",
                  teks2: "Red",
                  harga: "Rp20.000.000.000",
                  gambar: "assets/images/sf90.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "Ferrari 488 GTB",
                  teks2: "Maroon",
                  harga: "Rp10.000.000.000",
                  gambar: "assets/images/488gtb.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "Ferrari HURACAN",
                  teks2: "Blue",
                  harga: "Rp8.900.000.000",
                  gambar: "assets/images/huracan1.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "Ferrari GTC",
                  teks2: "Black",
                  harga: "Rp11.000.000.000",
                  gambar: "assets/images/gtc.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "Ferrari 488 Spider",
                  teks2: "Blue",
                  harga: "Rp5.000.000.000",
                  gambar: "assets/images/488spider.png",
                ),
              ],
            ),
            ListView(
              children: [
                kotak(
                  lebar: lebarukuran,
                  teks1: "Lamborghini Aventador",
                  teks2: "Orange",
                  harga: "Rp6.600.000.000",
                  gambar: "assets/images/aventador.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "Lamborghini Urus",
                  teks2: "Yellow",
                  harga: "Rp14.000.000.000",
                  gambar: "assets/images/urus.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "Lamborghini Asterion Concept Car",
                  teks2: "Blue",
                  harga: "Rp6.700.000.000",
                  gambar: "assets/images/asterion.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "Lamborghini Centenario",
                  teks2: "Metalic",
                  harga: "Rp30.000.000.000",
                  gambar: "assets/images/centenario.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "Lamborghini Veneno Roadster",
                  teks2: "Metalic",
                  harga: "Rp65.200.000.000",
                  gambar: "assets/images/Veneno.png",
                ),
              ],
            ),
            ListView(
              children: [
                kotak(
                  lebar: lebarukuran,
                  teks1: "BMW Series 3 Touring",
                  teks2: "Black",
                  harga: "Rp1.460.000.000",
                  gambar: "assets/images/bmw3.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "BMW Convertible",
                  teks2: "Silver",
                  harga: "Rp1.530.000.000",
                  gambar: "assets/images/convertable.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "BMW Gran Turismo",
                  teks2: "Silver",
                  harga: "Rp1.850.000.000",
                  gambar: "assets/images/turismo.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "BMW Seire Coupe",
                  teks2: "Silver",
                  harga: "Rp1.400.000.000",
                  gambar: "assets/images/coupe.png",
                ),
                kotak(
                  lebar: lebarukuran,
                  teks1: "BMW X3",
                  teks2: "Black",
                  harga: "Rp851.000.000",
                  gambar: "assets/images/bmwx3.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
