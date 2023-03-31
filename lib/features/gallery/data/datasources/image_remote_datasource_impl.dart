import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:paperless_app/features/gallery/data/datasources/image_remote_datasource.dart';
import 'package:paperless_app/features/gallery/domain/entities/network_image_data.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/network_image_data_model.dart';

class ImgRemoteDataSourceImpl extends ImgRemoteDatasource {
  @override
  Future<List<NetworkImageData>?>? getAllItems([int index = 0]) async {
    final http.Client httpClient = http.Client();

    http.Response response = await httpClient.get(
        Uri.parse('https://api.thedogapi.com/v1/images/search?limit=10'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key':
              'live_l6oIQkvfBTneADFNTQMAZ3aIQjdJSnwCEwEWKNtY75bjUWZSwD5AxVckNyA3ZzCX'
        });

    try {
      if (response.body.isNotEmpty) {
        return compute(_parseItems, response.body);
      } else {
        throw ServerException(code: response.statusCode);
      }
    } on PlatformException {
      return null;
    }
  }

  List<NetworkImageData> _parseItems(String responseBody) {
    final parsed = jsonDecode(responseBody);

    final List<NetworkImageData> data = parsed
        .map<NetworkImageData>(
            (m) => NetworkImageDataModel.fromMap(Map<String, dynamic>.from(m)))
        .toList();

    return data;
  }
}
