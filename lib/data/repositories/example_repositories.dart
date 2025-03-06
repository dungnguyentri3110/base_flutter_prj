import 'dart:developer';

import 'package:base_flutter_prj/data/models/example_model/example_model.dart';
import 'package:base_flutter_prj/data/models/music_model/music_model.dart';
import 'package:base_flutter_prj/data/remote/api_manager.dart';
import 'package:base_flutter_prj/data/remote/retrofits/example_request.dart';
import 'package:dio/dio.dart';

class ExampleRepositories {
  final ExampleClient api;

  ExampleRepositories({required this.api});

  Future<List<ExampleModel>> getListExample() {
    return api.getListExample();
  }

  Future<List<MusicModel>> getListMusic() async {
    try {
      final response = await api.getListMusic();
      List<MusicModel> listMusic = [];
      if (response.code == ErrorCode.success.value) {
        for (var e in response.data['listMusic']) {
          final item = MusicModel.fromJson(e);
          listMusic.add(item);
        }
        return listMusic;
      } else {
        throw ApiException(code: response.code, message: response.message);
      }
    } on DioException catch (error) {
      rethrow;
    }
  }
}
