import 'package:http/http.dart' as http;
class Service {
  final Map<String,String> contentType = {"Content-Type":"application/json"};

  Future postData(url,body) {
     return http.post(url, headers: contentType, body: body);
  }
  Future getPatientData(url,phrId){
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }
}