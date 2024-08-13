import 'package:equran_app/features/presentation/pages/tafsir/tafsir_binding.dart';
import 'package:equran_app/features/presentation/pages/tafsir/tafsir_page.dart';
import 'package:get/get.dart';

final tafsirRoute = [
  GetPage(
    name: TafsirPage.routeName,
    page: () => const TafsirPage(),
    binding: TafsirBinding(),
  )
];
