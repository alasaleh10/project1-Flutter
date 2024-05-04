import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String baseUrl = 'http://10.0.2.2/project1';
  postData({required String endPoint, required dynamic data}) async {
    log('$baseUrl/$endPoint');

    try {
      var response =
          await http.post(Uri.parse('$baseUrl/$endPoint'), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      } else {
        log('Error ${response.statusCode}');
      }
    } catch (e) {
      log('Error catch $e');
    }
  }

  getData({required String endPoint}) async {
    log('$baseUrl/$endPoint');

    try {
      var response = await http.get(Uri.parse('$baseUrl/$endPoint'));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      } else {
        log('Error ${response.statusCode}');
      }
    } catch (e) {
      log('Error catch $e');
    }
  }

  postwithFile(String endpoints, Map data, File file) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/$endpoints'));

      var length = await file.length();
      var stream = http.ByteStream(file.openRead());

      var muiltpartfile = http.MultipartFile("file", stream, length,
          filename: basename(file.path));
      request.files.add(muiltpartfile);
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      var myrequest = await request.send();

      var response = await http.Response.fromStream(myrequest);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log('Error ${myrequest.statusCode}');
      }
    } catch (e) {
      log('Error is $e');
    }
  }
}
