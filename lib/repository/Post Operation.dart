import 'dart:convert';
import 'dart:io';
import 'package:green_master/models/SellerPost.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/BuyerPost.dart';

class PostOP {
  final baseUrl = 'http://10.0.2.2:8000';

  Future<bool> sentPost(var title, var desc, var image, var voice) async {
    SharedPreferences loggedin = await SharedPreferences.getInstance();
    String storedToken = loggedin.getString('token') ?? '';
    print("Voice ${voice}");
    var headers = {
      'Accept': '*/*',
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer ${storedToken}'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}/api/posts'));
    request.fields.addAll({
      'title': title,
      'content': desc,
    });

    request.files.add(await http.MultipartFile.fromPath('images[]', image));
    //request.files.add(await http.MultipartFile.fromPath('voice', voice));
    /*request.headers[HttpHeaders.contentTypeHeader] =
        request.headers[HttpHeaders.contentTypeHeader] ?? "";*/
    request.headers.addAll(headers);

    final response = await request.send();
    var responseBody = await response.stream.bytesToString();
    print(responseBody);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response);
      return true;
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
      return false;
    }
  }

  Future getSellerPost() async {
    SharedPreferences loggedin = await SharedPreferences.getInstance();
    String storedToken = loggedin.getString('token') ?? '';
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': 'Bearer ${storedToken}'
    };
    var request =
        http.MultipartRequest('GET', Uri.parse('${baseUrl}/api/user/ownPosts'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return Seller.fromJson(jsonDecode(responseBody));
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data');
    }
  }

  Future getBuyersPost() async {
    SharedPreferences loggedin = await SharedPreferences.getInstance();
    String storedToken = loggedin.getString('token') ?? '';
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': 'Bearer ${storedToken}'
    };
    var request =
        http.MultipartRequest('GET', Uri.parse('${baseUrl}/api/activePosts'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return Buyer.fromJson(jsonDecode(responseBody));
    } else {
      print(response.reasonPhrase);
    }
  }
}
