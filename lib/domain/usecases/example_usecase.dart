import 'package:base_flutter_prj/data/models/music_model/music_model.dart';
import 'package:base_flutter_prj/data/remote/api_manager.dart';
import 'package:base_flutter_prj/domain/entity/base_response/base_response.dart';
import 'package:base_flutter_prj/domain/repository/example_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
final class ExampleUsecase {
  final ExampleRepository _repository;

  ExampleUsecase({required ExampleRepository repository})
    : _repository = repository;

  Future<Either<ApiException, BaseResponse<List<MusicModel>>>>
  getListMusic() async {
    return await _repository.getListMusic();
  }
}
