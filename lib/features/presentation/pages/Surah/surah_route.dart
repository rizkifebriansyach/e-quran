import 'package:equran_app/features/presentation/pages/Surah/surah_binding.dart';
import 'package:equran_app/features/presentation/pages/Surah/surah_page.dart';
import 'package:get/get.dart';

final surahRoute = [
  GetPage(
    name: SurahPage.routeName,
    page: () => const SurahPage(),
    binding: SurahBinding(),
  )
];
