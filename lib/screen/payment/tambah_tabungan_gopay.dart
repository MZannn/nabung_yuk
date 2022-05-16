import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nabung_yuk/controller/login_controller.dart';

import '../../controller/tambah_tabungan_controller.dart';

class TambahTabunganGopay extends StatelessWidget {
  const TambahTabunganGopay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tambahC = Get.put(TambahTabunganController());
    final loginC = Get.find<LoginController>();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: tambahC.uangMasuk,
        builder: (BuildContext context, value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(children: [
              const Text(
                'Masukkan Nominal',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: TextFormField(
                  controller: tambahC.uangMasuk,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: '100000',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(style: BorderStyle.none, width: 0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Gopay'),
                    subtitle: Text('Saldomu : Rp 10.000.000'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final format = DateFormat("dd-MM-yyyy HH:mm:ss");
                      final date = format.format(DateTime.now()).toString();
                      tambahC.addData(
                          loginC.email.text, date, tambahC.uangMasuk.text);
                      tambahC.uangMasuk.clear();
                    },
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          'Konfirmasi & Bayar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Text('Rp. ${tambahC.uangMasuk.value.text}'),
                        const Icon(
                          Icons.arrow_circle_right_sharp,
                          size: 27,
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 13, 161, 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  )
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
