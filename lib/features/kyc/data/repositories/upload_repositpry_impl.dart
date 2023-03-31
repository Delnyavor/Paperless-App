import 'package:paperless_app/features/kyc/domain/entities/identifier.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/upload_repository.dart';
import '../datasources/upload_data.dart';

class UploadRepositoryImpl extends UploadRepository {
  final UploadDataSource dataSource;

  UploadRepositoryImpl({required this.dataSource});

  @override
  Future<Failure?>? uploadData(Identifier id) async {
    try {
      final result = await dataSource.uploadData(id);
      if (result < 200 || result > 205) {
        return const ServerFailure(message: 'Something went wrong');
      }
      return null;
    } on Exception catch (_) {
      return const GenericOperationFailure(message: '');
    }
  }
}
