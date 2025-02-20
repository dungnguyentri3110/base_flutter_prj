import 'package:base_flutter_prj/data/models/example_model/example_model.dart';
import 'package:base_flutter_prj/data/remote/retrofits/example_request.dart';

class ExampleRepositories {
  final ExampleClient api;

  ExampleRepositories({required this.api});

  Future<List<ExampleModel>> getListExample() {
    return api.getListExample();
  }
}
