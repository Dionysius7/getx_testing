class Const{
   //Static PHR_ID [Delete Later]
   final String phrId = "EJDDU9XIJAv6acaqRlDE";

   final String genderSystem = "http://hl7.org/fhir/administrative-gender";
   final String nikSystem = "https://us-central1-phr-api.cloudfunctions.net/nik";
   final String bpjsSystem ="https://us-central1-phr-api.cloudfunctions.net/bpjs";
   final String hospitalSystem = "https://us-central1-his-api-93700.cloudfunctions.net/";

   final String phrPatientPost = "https://us-central1-phr-api.cloudfunctions.net/patient/";
   final String phrPatientGet = "https://us-central1-phr-api.cloudfunctions.net/patient/";

   final String phrConditionGet = "https://us-central1-phr-api.cloudfunctions.net/condition/";
   final String phrConditionPost = "https://us-central1-phr-api.cloudfunctions.net/condition/";

   final String phrNotifGet = "https://us-central1-phr-api.cloudfunctions.net/notification/";
   final String phrNotifPostPatient = "https://us-central1-his-api-93700.cloudfunctions.net/notification/patient/";
   final String phrNotifPostCondition = "https://us-central1-his-api-93700.cloudfunctions.net/notification/condition/";
}