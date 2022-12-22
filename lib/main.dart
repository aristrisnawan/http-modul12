import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:minggu_12/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String apiUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List<dynamic>> _fetchData() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Modul 12"),
        ),
        body: Container(
          child: FutureBuilder(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const DetailPage())));
                      },
                      child: Card(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text(snapshot.data![index]['title']),
                          ),
                        ),
                      ),
                    ),
                  );
                }));
              } else if (snapshot.hasError) {
                return Text("Data Not Found");
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
