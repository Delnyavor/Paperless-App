import 'package:paperless_app/features/gallery/domain/entities/network_image_data.dart';

class NetworkImageDataModel extends NetworkImageData {
  const NetworkImageDataModel(
      {required super.id, required super.url, super.height, super.width});

  factory NetworkImageDataModel.fromMap(Map data) {
    return NetworkImageDataModel(
      id: data['id'],
      url: data['url'],
      height: data['height'],
      width: data['width'],
    );
  }
}
