import 'dart:async';
import 'dart:convert';

import 'package:funda/model/apartment.dart';
import 'package:funda/model/apartment_index.dart';
import 'package:funda/model/network_exception.dart';
import 'package:funda/utils.dart';
import 'package:http/http.dart' as http;

class WebService {
  static const String apiKey = 'ac1b0b1572524640a0ecc54de453ea9f';
  static const int timeoutInSeconds = 10;

  static const String baseURL = 'partnerapi.funda.nl';
  static const String indexPath = '/feeds/Aanbod.svc/json/$apiKey/?type=koop&zo=/amsterdam/tuin/video';
  static const String apartmentPath = '/feeds/Aanbod.svc/json/detail';

  //Example URL: http://partnerapi.funda.nl/feeds/Aanbod.svc/json/ac1b0b1572524640a0ecc54de453ea9f/?type=koop&zo=/amsterdam/tuin/video/
  Future<ApartmentIndex> getIndex() async {
    final response =
        await http.get(Uri.https(baseURL, indexPath)).timeout(const Duration(seconds: timeoutInSeconds), onTimeout: () {
      throw TimeoutException('Server timeout');
    });

    dPrint(response.request!.url.toString());

    if (response.statusCode == 200) {
      dPrint(response.body);
      return ApartmentIndex.fromJson(json.decode(response.body));
    } else {
      // could be improved tracking various error codes and messages
      throw NetworkException(response.statusCode, 'Error ${response.statusCode}');
    }
  }

  //Example URL: https://partnerapi.funda.nl/feeds/Aanbod.svc/json/detail/ac1b0b1572524640a0ecc54de453ea9f/koop/36569869-c4f0-4407-b105-90e91a541f09
  Future<Apartment> getApartment(String identifier) async {
    final response = await http
        .get(Uri.https(baseURL, '$apartmentPath/$apiKey/koop/$identifier'))
        .timeout(const Duration(seconds: timeoutInSeconds), onTimeout: () {
      throw TimeoutException('Server timeout');
    });

    dPrint(response.request!.url.toString());

    if (response.statusCode == 200) {
      dPrint(response.body);
      return Apartment.fromJson(json.decode(response.body));
    } else {
      // could be improved tracking various error codes and messages
      throw NetworkException(response.statusCode, 'Error ${response.statusCode}');
    }
  }
}
