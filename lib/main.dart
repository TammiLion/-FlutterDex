import 'dart:convert' as convert;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutterdex/bottomsheet.dart';
import 'package:flutterdex/data/Pokemon.dart';
import 'package:flutterdex/network/api/PokeApi.dart';
import 'package:logger/logger.dart';

import 'network/data/NetworkResource.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(title: 'FlutterDex', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  var networkResource = NetworkResource(Pokemon(name: "missingno"));

  Widget _buildSuggestions() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        // The itemBuilder callback is called once per suggested
        // word pairing, and places each suggestion into a ListTile
        // row. For even rows, the function adds a ListTile row for
        // the word pairing. For odd rows, the function adds a
        // Divider widget to visually separate the entries. Note that
        // the divider may be difficult to see on smaller devices.
        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return Divider();
          }

          // The syntax "i ~/ 2" divides i by 2 and returns an
          // integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings
          // in the ListView,minus the divider widgets.
          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(networkResource.when(
            (Pokemon data) => data.name ?? "missingno",
            loading: () => "loading",
            error: (String? message) => message ?? "errorNull")),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              child: Text(
                "Nav",
                style: GoogleFonts.roboto(),
              ),
              onPressed: () {
                //doPokemonCall();
                doRetrofitCall();
              },
            ),
            BottomSheetshowingButton(),
            Image.asset("assets/images/furniture_spritesheet.png"),
            Expanded(child: _buildSuggestions()),
          ],
        ),
      ),
    );
  }

  void writeTest() {
    testStream();

    var something = NetworkResource.error();
    var something2 = NetworkResource(Pokemon(name: "Charmander"));
    var something3 = NetworkResource.error("Error");

    something2.when((Object data) => print('$data'),
        loading: () => print('loading'),
        error: (String? message) => print('$message'));
  }

  final log = Logger();

  doRetrofitCall() {
    writeTest();

    setState(() {
      networkResource = NetworkResource.loading();
    });
    final dio = Dio(); // Provide a dio instance
    dio.options.headers["Demo-Header"] =
        "demo header"; // config your dio headers globally
    dio.interceptors.add(LogInterceptor(responseBody: false));
    final client = PokeApi(dio);

    client.getPokemonByName("ditto").then((it) {
      log.i(it);
      setState(() {
        networkResource = NetworkResource(it);
      });
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          log.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          setState(() {
            networkResource = NetworkResource.error("Error : ${obj.message}");
          });
          break;
        default:
      }
    });
  }

  Stream<int> countStream(int max) async* {
    for (int i = 0; i < max; i++) {
      yield i;
    }
  }

  Future<int> sumStream(Stream<int> stream) async {
    int sum = 0;
    await for (int value in stream) {
      sum += value;
    }
    return sum;
  }

  void testStream() async {
    /// Initialize a stream of integers 0-9
    Stream<int> stream = countStream(10);
    /// Compute the sum of the stream of integers
    stream.listen((event) {
      log.i('emitted: $event');
    });
    //int sum = await sumStream(stream);
    /// Print the sum
    //log.i('sum: $sum');
  }
}
