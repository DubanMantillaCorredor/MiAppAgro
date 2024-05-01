import 'dart:io';

import 'package:mi_agro_app/Models/ResponseHttpDto.dart';
import 'package:mi_agro_app/Services/IFieldDiaryService.dart';
import 'package:mi_agro_app/Services/Service.dart';
import 'package:http/http.dart' as http;

class FieldDiaryService extends Service implements IFieldDiaryService {
  ResponseHttpDto responseHttpDto = ResponseHttpDto();

  FieldDiaryService() {
    setUrlRelative = "api/field_diaries";
  }

  @override
  Future<dynamic> syncData(String body) async {
    String url = "$urlRelative/sync";
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer ${GetToken()}'
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
