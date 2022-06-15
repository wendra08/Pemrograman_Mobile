import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebarukuran = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "CAR SHOW ROOM",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Anton",
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "By",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Lobster",
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Muhammad Wendra Suryananda",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Lobster",
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: lebarukuran,
                    height: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/huracan.png'),
                    )),
                  ),
                  const Text(
                    "HURACAN",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Anton",
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Lamborghini Huracan is a luxury sports car that will be released in 2022. Huracan is offered with many features in each variant, thus making it competent in the Coupe segment. Powering the Huracan LP 610-4 is a 5204 cc engine that produces 603 hp with a maximum torque of 560 Nm. The highest variant of the Huracan is efficient with fuel consumption of 5.6 kmpl in the city, and 10.6 kmpl on toll roads.",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Noto",
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: lebarukuran,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      onPressed: () {
                        Get.snackbar(
                          "Pemberitahuan",
                          "Berhasil masuk!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.grey,
                          colorText: Colors.white,
                          margin: const EdgeInsets.all(12),
                        );
                        Get.to(() => MainPage());
                      },
                      child: const Text("Lanjutkan"),
                    ),
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
