import 'dart:convert';

import 'package:currencies/data/api_provider.dart';
import 'package:currencies/data/remote_currency.dart';
import 'package:http/http.dart';

class ApiProviderImpl implements APIProvider {
  final client = Client();
  static const baseUrl = "sample-comments-service-5y6owysdhq-uc.a.run.app";

  @override
  Future<(List<RemoteCurrency> currencies, int timestamp)> fetch() async {
    final uri = Uri.https(baseUrl, '/fx/current');
    try {
      final res = await client.get(uri, headers: {'api-key': '795cfec4-68b1-42d6-baa0-16a53ce09a1d'});
      final json = res.body;

      final raw = jsonDecode(json) as Map<String, dynamic>;
      final timestamp = raw['timestamp'] as int;
      final rawCurrencies = raw['currencies'] as List<dynamic>;
      final currencies = rawCurrencies.map((currencyMap) => RemoteCurrency.fromMap(currencyMap));
      // return currencies.toList();
      return (currencies.toList(), timestamp);
    } catch(e) {
      print(e);
      return (<RemoteCurrency>[], 0);
    }
  }

}