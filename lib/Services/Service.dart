class Service {
  final String _urlBase = "https://";
  String _urlRelative = "";

  set setUrlRelative(String url) {
    _urlRelative = url;
  }

  String get urlRelative => "$_urlBase/$_urlRelative";

  Service(){}
}