import 'package:equran_app/features/presentation/pages/Detail/detail_controller.dart';
import 'package:equran_app/features/presentation/pages/tafsir/tafsir_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  static String routeName = '/detail';

  const DetailPage({super.key});
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
                          controller.detailData.value?["namaLatin"] ?? "wah",
                        ),
                        Text(
                          '${controller.detailData.value?["tempatTurun"]} - ${controller.detailData.value?["jumlahAyat"]} ayat - ${controller.detailData.value?["arti"]}',
                        ),
                        const Divider(),
                        const Expanded(
                            child: Center(
                                child: Text(
                          "بِسْمِ اللّهِ الرَّحْمَنِ الرَّحِيْمِ",
                          style: TextStyle(fontSize: 28),
                        )))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Lihat Tafsir"),
              onPressed: () {
                Get.toNamed(
                  TafsirPage.routeName,
                  arguments: controller.detailData.value?["nomor"],
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Obx(
                () => Container(
                  width: double.infinity,
                  child: (controller.detailData.value?["ayat"].length != null)
                      ? ListView.separated(
                          separatorBuilder: (context, length) => Divider(),
                          itemCount:
                              controller.detailData.value?["ayat"].length,
                          itemBuilder: (context, index) {
                            return cardItem(
                              nomorAyat: controller.detailData.value?["ayat"]
                                  [index]["nomorAyat"],
                              teksArab: controller.detailData.value?["ayat"]
                                  [index]["teksArab"],
                              teksLatin: controller.detailData.value?["ayat"]
                                  [index]["teksLatin"],
                              teksIndonesia: controller.detailData
                                  .value?["ayat"][index]["teksIndonesia"],
                            );
                          },
                        )
                      : Text("data tidak ditemukan"),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget cardItem({
    required int nomorAyat,
    required String teksArab,
    required String teksLatin,
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
              Text(nomorAyat.toString()),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  teksArab,
                  style: TextStyle(
                    color: Colors.lightGreenAccent.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                teksLatin,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(teksIndonesia),
            ],
          ),
        ),
      ),
    );
  }
}
