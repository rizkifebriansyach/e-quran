import 'package:equran_app/features/presentation/pages/Detail/detail_page.dart';
import 'package:equran_app/features/presentation/pages/Surah/surah_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahPage extends GetView<SurahController> {
  static String routeName = '/surah';
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Container(
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, length) => Divider(),
                    itemCount: controller.responseListSurah.value.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            DetailPage.routeName,
                            arguments:
                                controller.responseListSurah.value[index].nomor,
                          );
                        },
                        child: cardItem(
                          nomor:
                              controller.responseListSurah.value[index].nomor!,
                          namaLatin: controller
                              .responseListSurah.value[index].namaLatin!,
                          nama: controller.responseListSurah.value[index].nama!,
                          arti: controller.responseListSurah.value[index].arti!,
                          tempatTurun: controller
                              .responseListSurah.value[index].tempatTurun!,
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget cardItem({
    required int nomor,
    required String namaLatin,
    required String nama,
    required String arti,
    required String tempatTurun,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              Text(
                nomor.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaLatin,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      " $tempatTurun - $arti",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                nama,
                style: TextStyle(
                  color: Colors.lightGreenAccent.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
