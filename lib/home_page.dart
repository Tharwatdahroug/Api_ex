import 'dart:convert';

import 'package:api_ex/Datum.dart';
import 'package:api_ex/city_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  Future<List<Datum?>> getdata() async {
    var response = await http.get(Uri.parse(
        "https://alalmiyalhura-58f05-default-rtdb.firebaseio.com/cities.json"));
    print(response.body);
    var dacode = jsonDecode(response.body);
    final data = CityData.fromJson(dacode);
    List<Datum?> data2 = data.data;
    print(data2);
    return data2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Datum? datum = snapshot.data?[index];
                    if (datum != null) {
                      return ListTile(
                        title: Text(datum.name),
                      );
                    } else {
                      return Center(child: Text("Is Empty"));
                    }
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
