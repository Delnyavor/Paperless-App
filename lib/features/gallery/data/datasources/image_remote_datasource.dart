import 'package:paperless_app/features/gallery/domain/entities/network_image_data.dart';

abstract class ImgRemoteDatasource {
  Future<List<NetworkImageData>?>? getAllItems();
}
