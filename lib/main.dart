import 'package:equran_app/features/presentation/pages/Surah/surah_page.dart';
import 'package:equran_app/features/presentation/routes/routes.dart';
import 'package:equran_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  await ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoutes.routes,
      initialRoute: SurahPage.routeName,
      // home: const ,
    );
  }
}

