
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String nama = "", ttl = "", alamat = "", agama = "";

  TextEditingController namaController = TextEditingController();
  TextEditingController ttlController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController agamaController = TextEditingController();

  List<String> genderList = ["Laki - Laki", "Perempuan"];
  String gender = "";

  bool tampilOutput = false;

  @override
  void dispose() {
    namaController.dispose();
    ttlController.dispose();
    alamatController.dispose();
    agamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          controller: namaController,
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
                          controller: ttlController,
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
                          controller: alamatController,
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
                          controller: agamaController,
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
                        for (var item in genderList)
                          Row(
                            children: [
                              Radio(
                                activeColor: Colors.white,
                                value: item,
                                groupValue: gender,
                                onChanged: (v) {
                                  setState(() {
                                    gender = v.toString();
                                  });
                                },
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
                              setState(() {
                                nama = namaController.text;
                                ttl = ttlController.text;
                                alamat = alamatController.text;
                                agama = agamaController.text;

                                tampilOutput = true;
                              });
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
                        if (tampilOutput)
                          Container(
                            width: lebarukuran,
                            padding: EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Anda : $nama",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Anton",
                                  ),
                                ),
                                Text(
                                  "TTL Anda : $ttl",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Anton",
                                  ),
                                ),
                                Text(
                                  "Alamat Anda : $alamat",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Anton",
                                  ),
                                ),
                                Text(
                                  "Agama Anda : $agama",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Anton",
                                  ),
                                ),
                                Text(
                                  "Gender Anda : $gender",
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
                                      setState(() {
                                        tampilOutput = false;
                                      });
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
