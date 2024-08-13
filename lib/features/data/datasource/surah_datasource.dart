import 'package:equran_app/features/data/model/detail_surah.dart';
import 'package:equran_app/features/data/model/surah.dart';
import 'package:equran_app/utils/network/api_request.dart';
import 'package:equran_app/utils/network/api_response.dart';

abstract class SurahRemoteDatasource {
  Future<List<SurahModel>> getSurahList();
  Future<Map<String, dynamic>> getDetailSurah({required int nomor});
  Future<Map<String, dynamic>> getDetailTafsir({required int nomor});
}

class SurahRemoteDatasourceImpl implements SurahRemoteDatasource {
  @override
  Future<Map<String, dynamic>> getDetailSurah({required int nomor}) async {
    try {
      final response = await ApiRequest.get(url: "surat/$nomor");
      return
          ApiResponse.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getDetailTafsir({required int nomor}) async {
    try {
      final response = await ApiRequest.get(url: "tafsir/$nomor");
      return ApiResponse.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SurahModel>> getSurahList() async {
    try {
      final response = await ApiRequest.get(url: "surat");
      return (response.data['data'] as List)
          .map((data) => SurahModel.fromJson(data))
          .toList()
          .cast<SurahModel>();
    } catch (e) {
      rethrow;
    }
  }
}
