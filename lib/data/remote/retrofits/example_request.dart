import 'package:base_flutter_prj/data/models/example_model/example_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'example_request.g.dart';

@RestApi(baseUrl: '')
abstract class ExampleClient {
  factory ExampleClient(Dio dio, {String? baseUrl}) = _ExampleClient;

  @GET('/enpoint')
  Future<List<ExampleModel>> getListExample();
}
