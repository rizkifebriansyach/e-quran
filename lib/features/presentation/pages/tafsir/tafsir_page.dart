import 'package:equran_app/features/presentation/pages/tafsir/tafsir_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TafsirPage extends GetView<TafsirController> {
  static String routeName = '/tafsir';
  const TafsirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            controller.tafsirData.value?["namaLatin"] ?? "wah",
                          ),
                          Text(
                            '${controller.tafsirData.value?["tempatTurun"]} - ${controller.tafsirData.value?["jumlahAyat"]} ayat - ${controller.tafsirData.value?["arti"]}',
                          ),
                          const Divider(),
                          const Expanded(
                            child: Center(
                              child: Text(
                                "بِسْمِ اللّهِ الرَّحْمَنِ الرَّحِيْمِ",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text("Lihat Surat"),
                ),
              ),
              Expanded(
                child: Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    child: (controller.tafsirData.value?['tafsir'].length !=
                            null)
                        ? ListView.separated(
                            separatorBuilder: (context, length) => Divider(),
                            itemCount:
                                controller.tafsirData.value?['tafsir'].length,
                            itemBuilder: (context, index) {
                              return cardItem(
                                  nomorAyat:
                                      "ayat: ${controller.tafsirData.value?['tafsir'][index]['ayat']}",
                                  teksIndonesia: controller.tafsirData
                                      .value?['tafsir'][index]['teks']);
                            },
                          )
                        : Text("data tidak ditemukan"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardItem({
    required String nomorAyat,
    required String teksIndonesia,
  }) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nomorAyat.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(teksIndonesia),
            ],
          ),
        ),
      ),
    );
  }
}
