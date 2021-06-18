import 'package:http/http.dart' as http;
class Service {
  final Map<String,String> contentType = {"Content-Type":"application/json"};

  Future postPatientData(url,body) {
     return http.post(url, headers: contentType, body: body);
  }
  Future getPatientData(url,phrId){
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }
  Future getAllPatientData(url){
    var finalUrl = Uri.parse(url);
    return http.get(finalUrl);
  }
  Future getAllNotifData(url,phrId){
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }
  Future postNotifToPHR(url,phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.post(finalUrl, headers: contentType);
  }
  Future getAllConditionData(url,phrId){
    var finalUrl = Uri.parse(url + phrId);
    print(finalUrl);
    return http.get(finalUrl);
  }
}