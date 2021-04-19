import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterdex/bottomsheet.dart';
import 'package:flutterdex/data/Pokemon.dart';
import 'package:flutterdex/network/api/PokeApi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import 'network/data/NetworkResource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('nl')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  var networkResource = NetworkResource(Pokemon(name: "missingno"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(networkResource.when(
            (Pokemon data) => data.name ?? "missingno",
            loading: () => "loading",
            error: (String? message) => message ?? "errorNull")).tr(),
      ),
      body: Container(
        child: Column(
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
