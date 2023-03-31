import 'package:paperless_app/features/gallery/data/datasources/image_remote_datasource.dart';
import 'package:paperless_app/features/gallery/domain/entities/network_image_data.dart';

import 'package:paperless_app/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/network_image_repository.dart';

class NetworkImageRepositoryImpl extends NetworkImageRepository {
  final ImgRemoteDatasource dataSource;

  NetworkImageRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<NetworkImageData>?>>? getAllItems() async {
    try {
      final result = await dataSource.getAllItems();
      return Right(result);
    } on ServerException catch (_) {
      return const Left(ServerFailure(message: 'Something went wrong'));
    } on CacheException catch (_) {
      return const Left(CacheFailure(message: ''));
    }
  }
}
