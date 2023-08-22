// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print

import 'package:http/http.dart';
import 'dart:convert';

class covid {
  var state;
  var confirmed;
  var recovered;
  var deaths;
  var active;

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise"));

      Map data = jsonDecode(response.body);
      //print(data);

//Getting Data
      Map mapdata = data['data'];
      // print(mapdata);
      List covid_data = mapdata['statewise'];
      //print(covid_data);
      Map covid_main_data = covid_data[0];
      print(covid_main_data);
      String getState = covid_main_data['state'];
      String getConfirmed = (covid_main_data['confirmed']).toString();
      String getRecovered = (covid_main_data['recovered']).toString();
      String getDeaths = (covid_main_data['deaths']).toString();
      String getActive = (covid_main_data['active']).toString();

//Assigning value
      state = getState;
      confirmed = getConfirmed;
      recovered = getRecovered;
      deaths = getDeaths;
      active = getActive;
    } catch (e) {
      state = "Not Found";
      confirmed = "Not Found";
      recovered = "Not Found";
      deaths = "Not Found";
      active = "Not Found";
      print("An error occurred: $e");
    }
  }
}
