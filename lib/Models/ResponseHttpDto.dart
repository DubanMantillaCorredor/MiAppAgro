enum ResponseType {
  Ok,
  Unauthorized,
  BadRequest,
  NoInternet,
  BadJson,
  BadFileSave
}

extension ResponseTypeValue on ResponseType {
  String get text {
    switch (this) {
      case ResponseType.Ok:
        return 'Ok';
      case ResponseType.Unauthorized:
        return 'Tu sesión ha finalizado';
      case ResponseType.BadRequest:
        return 'Ha ocurrido un error, si esto continua por favor comuniquese con el administrador';
      case ResponseType.NoInternet:
        return 'No se ha podido conectar con el servidor';
      case ResponseType.BadJson:
        return 'Error en la deserialización de los datos';
      case ResponseType.BadFileSave:
        return 'No se ha podido guardar el archivo';
      default:
        return 'Error desconocido';
    }
  }
}

class ResponseHttpDto {
  late ResponseType responseType;
  late dynamic data;
}
