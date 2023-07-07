/*
 * 
 * network_manager.dart
 * IsteFon-Flutter
 * 
 * Created on 08/02/2021.
 * Copyright (c) 2021 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'dart:convert';

import 'package:burgan_poc/core/network/query_providers/http_query_provider.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  final String baseURL;

  Map<String, String> get _defaultHeaders => {
        'Content-Type': 'application/json',
        'Accept-Language': 'tr',
      };

  NetworkManager({required this.baseURL});

  Future<Map<String, dynamic>> requestGet(
    String path, {
    List<HTTPQueryProvider> queryProviders = const [],
  }) async {
    var headers = _defaultHeaders;
    for (var provider in queryProviders) {
      headers.addAll(await provider.queries);
    }
    final response = await http.get(
      Uri.parse('$baseURL/$path'),
      headers: headers,
    );
    return createResponseMap(response);
  }

  Future<Map<String, dynamic>> requestPost(
    String path,
    Object body, {
    List<HTTPQueryProvider> queryProviders = const [],
  }) async {
    var headers = _defaultHeaders;
    for (var provider in queryProviders) {
      headers.addAll(await provider.queries);
    }
    final response = await http.post(
      Uri.parse('$baseURL/$path'),
      headers: headers,
      body: json.encode(body),
    );
    return createResponseMap(response);
  }

  Future<Map<String, dynamic>> requestDelete(String path) async {
    var headers = _defaultHeaders;

    final response = await http.delete(
      Uri.parse('$baseURL/$path'),
      headers: headers,
    );
    return createResponseMap(response);
  }

  Future<Map<String, dynamic>> createResponseMap(http.Response? response) async {
    Map<String, dynamic>? responseJSON;
    if (response?.body != null) {
      try {
        const utf8Decoder = Utf8Decoder();
        final responseString = utf8Decoder.convert(response!.bodyBytes);
        responseJSON = json.decode(responseString) as Map<String, dynamic>;
      } on Exception {
        responseJSON = {};
      }
    }

    if ((response?.statusCode ?? 0) >= 200 && (response?.statusCode ?? 0) < 300) {
      return responseJSON ?? {};
    } else {
      return {};
    }
  }
}
