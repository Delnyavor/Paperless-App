import '../../domain/entities/identifier.dart';

abstract class UploadDataSource {
  Future<int> uploadData(Identifier id);
}
