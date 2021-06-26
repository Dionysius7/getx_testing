class Const{
   //Static Hospital Name
   final String hospitalNameExample = "Rumah Sakit Bethsaida";

   final String genderSystem = "http://hl7.org/fhir/administrative-gender";
   final String nikSystem = "https://us-central1-phr-api.cloudfunctions.net/nik";
   final String bpjsSystem ="https://us-central1-phr-api.cloudfunctions.net/bpjs";
   final String hospitalSystem = "https://us-central1-his-api-93700.cloudfunctions.net/";

   final String categorySystem = "http://terminology.hl7.org/CodeSystem/condition-category";
   final String codeCodingSystem = "https://www.who.int/classifications/icd/icdonlineversions/en";
   final String subjectReferenceSystem = "https://us-central1-phr-api.cloudfunctions.net/patient";
   final String extensionLocationSystem = "https://us-central1-phr-api.cloudfunctions.net/location";

   final String phrPatientPost = "https://us-central1-phr-api.cloudfunctions.net/patient/";
   final String phrPatientGet = "https://us-central1-phr-api.cloudfunctions.net/patient/";

   final String phrConditionGet = "https://us-central1-phr-api.cloudfunctions.net/condition/";
   final String hospitalConditionPost = "https://us-central1-his-api-93700.cloudfunctions.net/condition/";
   final String hospitalConditionGet = "https://us-central1-his-api-93700.cloudfunctions.net/condition/";

   final String phrLoginPatient = "https://us-central1-phr-api.cloudfunctions.net/login/";

   final String phrNotifGet = "https://us-central1-phr-api.cloudfunctions.net/notification/";
   final String phrNotifUpdate = "https://us-central1-phr-api.cloudfunctions.net/notification/";
   final String hospitalNotifPostPatient = "https://us-central1-his-api-93700.cloudfunctions.net/notification/patient/";
   final String hospitalNotifPostCondition = "https://us-central1-his-api-93700.cloudfunctions.net/notification/condition/";

   
}