import 'package:paperless_app/features/kyc/data/datasources/upload_data.dart';

import '../../domain/entities/identifier.dart';

import 'package:http/http.dart' as http;

class UploadDataSourceImpl implements UploadDataSource {
  UploadDataSourceImpl();

  @override
  Future<int> uploadData(Identifier id) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://api.cloudinary.com/v1_1/paperless/image/upload'));

    request.fields.addAll({'upload_preset': 'ix8u70vl'});
    request.fields.addAll({'document_type': '${id.type}'});
    request.files.add(await http.MultipartFile.fromPath('file', id.front.path));
    request.files.add(await http.MultipartFile.fromPath('file', id.back.path));

    http.StreamedResponse response = await request.send();

    print(response.statusCode);
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return response.statusCode;
    } else {
      print(response.reasonPhrase);
      return response.statusCode;
    }
  }
}
