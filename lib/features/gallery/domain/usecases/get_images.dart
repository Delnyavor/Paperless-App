import 'package:dartz/dartz.dart';
import 'package:paperless_app/features/gallery/domain/entities/network_image_data.dart';

import '../../../../core/error/failure.dart';
import '../repositories/network_image_repository.dart';

class GetImages {
  final NetworkImageRepository repository;

  const GetImages({required this.repository});

  Future<Either<Failure, List<NetworkImageData>?>?>? call() async {
    return await repository.getAllItems();
  }
}
