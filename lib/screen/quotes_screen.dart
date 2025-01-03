import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app_with_api/model/quote_model.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  void initState() {
    super.initState();
    hitQuotesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quotes",
            style: TextStyle(
                fontSize: 22,
                fontFamily: "primary",
                shadows: [Shadow(color: Colors.blueAccent, blurRadius: 5)]),
          ),
          backgroundColor: Colors.yellow.shade100,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/quote.png"),
          ),
          actions: const [
            Icon(
              Icons.notifications_none_rounded,
              size: 30,
              color: Colors.black,
              shadows: [Shadow(color: Colors.blueAccent, blurRadius: 5)],
            )
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          shadowColor: Colors.black,
          elevation: 11,
        ),
        backgroundColor: Colors.blueAccent.shade100,

        /// data show in body
        body: FutureBuilder(
          future: hitQuotesApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error Found : ${snapshot.error.toString()}"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.quotes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        /// title
                        title: Text(
                          snapshot.data!.quotes[index].quote,
                          style: const TextStyle(
                              fontFamily: "primary",
                              fontSize: 12,
                              color: Colors.black),
                        ),

                        /// sub title
                        subtitle: Text(
                          snapshot.data!.quotes[index].author,
                          style: const TextStyle(
                              fontFamily: "primary",
                              fontSize: 12,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: Image.asset(
                          "assets/images/quote.png",
                          height: 40,
                          width: 40,
                        ),
                        trailing: const Icon(
                          Icons.favorite_border_rounded,
                          size: 30,
                        ),
                        tileColor: Colors.yellow.shade100.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    );
                  });
            }
            return Container();
          },
        ));
  }

  ///___________________________FUNCTION________________________///

  /// here we create a function for hit API
  Future<QuoteDataModel?> hitQuotesApi() async {
    /// link in the description BOX
    String url = "https://dummyjson.com/quotes";
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      var resData = jsonDecode(res.body);
      return QuoteDataModel.myFromJson(resData);
    } else {
      return null;
    }
  }
}

/// complete