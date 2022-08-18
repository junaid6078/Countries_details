import 'dart:convert';
import 'dart:core';
import 'package:untitled/country.dart';
import 'package:flutter/material.dart';
import 'Models/CountriesModels.dart';
import 'package:http/http.dart' as http;

class AllCountries extends StatefulWidget {
  const AllCountries({Key? key}) : super(key: key);

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  List<CountriesModels> countrieslist = [];



  Future<List<CountriesModels>> getcountryapi() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        countrieslist.add(CountriesModels.fromJson(i));
      }
      return countrieslist;
    }
    return countrieslist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('All Countries'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getcountryapi(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: countrieslist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Country(
                                countrieslist[index].name!.common.toString(),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10.0,
                          color: Colors.white.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              countrieslist[index].name!.common.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
