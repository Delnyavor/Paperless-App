import 'package:dartz/dartz.dart';
import 'package:paperless_app/features/gallery/domain/entities/network_image_data.dart';

import '../../../../core/error/failure.dart';

abstract class NetworkImageRepository {
  Future<Either<Failure, List<NetworkImageData>?>>? getAllItems();
}
