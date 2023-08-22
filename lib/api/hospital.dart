// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_typing_uninitialized_variables, avoid_print

import 'package:http/http.dart';
import 'dart:convert';

class hospital {
  var state;
  var hospitals;
  var bed;

  Future<void> getData() async {
    try {
      Response response = await get(
          Uri.parse("https://api.rootnet.in/covid19-in/hospitals/beds"));

      Map data = jsonDecode(response.body);
      // print(data);

//Getting Data
      Map mapdata = data['data'];
      // print(mapdata);
      List hospital_data = mapdata['regional'];
      //print(covid_data);
      Map hospital_main_data = hospital_data[14];
      print(hospital_main_data);
      String getState = hospital_main_data['state'];

      String getHospitals = (hospital_main_data['totalHospitals']).toString();
      String getBed = (hospital_main_data['totalBeds']).toString();

//Assigning value
      state = getState;
      hospitals = getHospitals;
      bed = getBed;
    } catch (e) {
      state = "Not Found";
      hospitals = "Not Found";
      bed = "Not Found";

      print("An error occurred: $e");
    }
  }
}
