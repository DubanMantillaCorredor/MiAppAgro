import 'dart:io';

import 'package:mi_agro_app/Models/ResponseHttpDto.dart';
import 'package:mi_agro_app/Services/IUserService.dart';
import 'package:http/http.dart' as http;

import 'Service.dart';

class UserService extends Service implements IUserService {
  ResponseHttpDto responseHttpDto = ResponseHttpDto();

  UserService(){
    setUrlRelative = "";
  }

  @override
  Future<dynamic> sendLogin(String body) async {
    String url = "${urlRelative}login";

    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json"
          },
          body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        responseHttpDto.responseType = ResponseType.Ok;
        responseHttpDto.data = response.body;
        return responseHttpDto;
      } else if (response.statusCode == 404) {
        responseHttpDto.responseType = ResponseType.Unauthorized;
        throw responseHttpDto;
      } else if (response.statusCode >= 400 && response.statusCode < 600) {
        responseHttpDto.responseType = ResponseType.BadRequest;
        throw responseHttpDto;
      }
    } on SocketException catch (e) {
      responseHttpDto.responseType = ResponseType.NoInternet;
      throw responseHttpDto;
    }

  }
}