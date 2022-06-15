
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_controller/text_controller.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetxTextController tc = Get.put(GetxTextController());
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Form Data Diri",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Anton",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: tc.namaController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Masukkan Nama Anda ",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: tc.ttlController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Masukkan TTL",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          maxLines: 4,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: tc.alamatController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Masukkan Alamat Anda",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: tc.agamaController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Masukkan Agama Anda ",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        for (var item in tc.genderList)
                          Row(
                            children: [
                              Obx(
                                () => Radio(
                                  activeColor: Colors.white,
                                  value: item,
                                  groupValue: tc.gender.value,
                                  onChanged: (v) {
                                    tc.gender.value = v.toString();
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
                        SizedBox(
                          height: 50,
                          width: lebarukuran,
                          child: ElevatedButton(
                            onPressed: () {
                              tc.nama.value = tc.namaController.text;
                              tc.ttl.value = tc.ttlController.text;
                              tc.alamat.value = tc.alamatController.text;
                              tc.agama.value = tc.agamaController.text;

                              tc.tampilOutput.value = true;
                            }, //untuk primary
                            child: Text("Tampilkan"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => Visibility(
                            visible: tc.tampilOutput.value,
                            child: Container(
                              width: lebarukuran,
                              padding: EdgeInsets.all(20),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Anda : ${tc.nama.value}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Anton",
                                    ),
                                  ),
                                  Text(
                                    "TTL Anda : ${tc.ttl.value}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Anton",
                                    ),
                                  ),
                                  Text(
                                    "Alamat Anda : ${tc.alamat.value}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Anton",
                                    ),
                                  ),
                                  Text(
                                    "Agama Anda : ${tc.agama.value}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Anton",
                                    ),
                                  ),
                                  Text(
                                    "Gender Anda : ${tc.gender.value}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Anton",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: lebarukuran,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        tc.tampilOutput.value = false;
                                      }, //untuk primary
                                      child: Text("Tutup"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
