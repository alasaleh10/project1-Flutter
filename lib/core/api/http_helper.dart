import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;



class HttpHelper
{
  final String _baseUrl='http://10.0.2.2/project1';
postData({required String endPoint,required dynamic data})async
{

try {
      var response = await http.post(Uri.parse('$_baseUrl/$endPoint'), body: data);
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
}