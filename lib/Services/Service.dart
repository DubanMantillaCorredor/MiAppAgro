class Service {
  final String _urlBase = "http://192.168.1.67:3000";
  String _urlRelative = "";

  set setUrlRelative(String url) {
    _urlRelative = url;
  }

  String get urlRelative => "$_urlBase/$_urlRelative";



  Service(){}

  String GetToken(){
    return 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI3ZDE4OWEyYS1kZWMxLTRiMzAtOWY1ZC0zYTIxZDhkYTg0YmIiLCJzdWIiOiJjMDg2NDE5Yy05Yzk5LTQ3ZDYtYTEyYS0xN2M5M2I0MTYyOTgiLCJzY3AiOiJ1c2VyIiwiYXVkIjpudWxsLCJpYXQiOjE3MTQ1NDQ5MjQsImV4cCI6MTcxNzEzNjkyNH0.-aoJL1bBw0qY4Re0gi3R0kCqUaFduEPrRa62bBk5CaI';
  }
}