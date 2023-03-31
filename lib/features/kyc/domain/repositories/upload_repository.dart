import '../../../../core/error/failure.dart';
import '../entities/identifier.dart';

abstract class UploadRepository {
  Future<Failure?>? uploadData(Identifier id);
}
