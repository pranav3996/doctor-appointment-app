import 'package:http/http.dart';
import 'dart:convert';

class medical {
  var name;
  var products;

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.fda.gov/drug/drugsfda.json?count=sponsor_name"));

      Map data = jsonDecode(response.body);
      //print(data);

//Getting Data

      List drugs_data = data['results'];
      //print(covid_data);
      Map drugs_main_data = drugs_data[14];
      print(drugs_main_data);
      String getName = drugs_main_data['term'];
      String getProducts = (drugs_main_data['count']).toString();

//Assigning value
      name = getName;
      products = getProducts;
    } catch (e) {
      name = "Not Found";
      products = "Not Found";

      print("An error occurred: $e");
    }
  }
}
