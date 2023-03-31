import '../../../../core/error/failure.dart';
import '../entities/identifier.dart';
import '../repositories/upload_repository.dart';

class UploadKYC {
  final UploadRepository repository;

  UploadKYC({required this.repository});

  Future<Failure?>? call({required Identifier id}) async {
    return await repository.uploadData(id);
  }
}
