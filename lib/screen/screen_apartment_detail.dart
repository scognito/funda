import 'package:flutter/material.dart';
import 'package:funda/api/web/web_service.dart';
import 'package:funda/locator.dart';
import 'package:funda/model/apartment.dart';
import 'package:funda/styles.dart';
import 'package:funda/utils.dart';
import 'package:funda/widget/apartment_features.dart';
import 'package:funda/widget/apartment_info.dart';
import 'package:funda/widget/apartment_media.dart';
import 'package:funda/widget/retry.dart';

class ScreenApartmentDetail extends StatefulWidget {
  final String id;

  const ScreenApartmentDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<ScreenApartmentDetail> createState() => _ScreenApartmentDetailState();
}

class _ScreenApartmentDetailState extends State<ScreenApartmentDetail> {
  late Future<Apartment> future;

  @override
  void initState() {
    super.initState();
    future = fetchData();
  }

  Future<Apartment> fetchData() async {
    return await locator.get<WebService>().getApartment(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Apartment>(
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(color: kBackgroundColor),
            );
          default:
            if (snapshot.hasData) {
              Apartment apartment = snapshot.data!;

              return Scaffold(
                appBar: AppBar(title: Text(apartment.adres)),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ApartmentMedia(apartment: apartment),
                          ApartmentInfo(apartment: apartment),
                          ApartmentFeatures(apartment: apartment),
                        ],
                      ),
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.phone),
                  onPressed: () async {
                    if (apartment.makelaarTelefoon != null && apartment.makelaarTelefoon!.trim().isNotEmpty) {
                      await callPhone(apartment.makelaarTelefoon!);
                    }
                  },
                ),
              );
            } else {
              dPrint(snapshot.error);
              dPrint(snapshot.stackTrace);
              return Retry(
                  error: snapshot.error,
                  showGoBack: true,
                  callback: () {
                    setState(() {
                      future = fetchData();
                    });
                  });
            }
        }
      },
    ));
  }
}
