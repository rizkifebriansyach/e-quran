import 'package:equran_app/features/presentation/pages/Detail/detail_binding.dart';
import 'package:equran_app/features/presentation/pages/Detail/detail_page.dart';
import 'package:get/get.dart';

final detailRoute = [
  GetPage(
      name: DetailPage.routeName,
      page: () => const DetailPage(),
      binding: DetailBinding())
];
