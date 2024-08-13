import 'package:equran_app/features/presentation/pages/Detail/detail_route.dart';
import 'package:equran_app/features/presentation/pages/Surah/surah_route.dart';
import 'package:equran_app/features/presentation/pages/tafsir/tafsir_route.dart';

class AppRoutes {
  static final routes = [
    ...surahRoute,
    ...detailRoute,
    ...tafsirRoute,
  ];
}
