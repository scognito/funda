import 'package:flutter/material.dart';
import 'package:funda/api/web/web_service.dart';
import 'package:funda/locator.dart';
import 'package:funda/model/apartment_index.dart';
import 'package:funda/screen/screen_apartment_detail.dart';
import 'package:funda/styles.dart';
import 'package:funda/utils.dart';
import 'package:funda/widget/commons.dart';
import 'package:funda/widget/retry.dart';

class ScreenIndex extends StatefulWidget {
  const ScreenIndex({Key? key}) : super(key: key);

  @override
  State<ScreenIndex> createState() => _ScreenIndexState();
}

class _ScreenIndexState extends State<ScreenIndex> {
  late Future<ApartmentIndex> future;

  @override
  void initState() {
    super.initState();
    future = fetchData();
  }

  Future<ApartmentIndex> fetchData() async {
    return await locator.get<WebService>().getIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ApartmentIndex>(
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
              ApartmentIndex index = snapshot.data!;

              return Scaffold(
                appBar: AppBar(title: Text(index.metadata!.titel!)),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...index.objects!
                              .map((e) => ApartmentItem(
                                    apartmentObject: e,
                                  ))
                              .toList()
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              dPrint(snapshot.error);
              dPrint(snapshot.stackTrace);
              return Retry(
                  error: snapshot.error.toString(),
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

class ApartmentItem extends StatelessWidget {
  final ApartmentObject apartmentObject;

  const ApartmentItem({Key? key, required this.apartmentObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenApartmentDetail(id: apartmentObject.id!)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                child: Image.network(apartmentObject.foto!),
              ),
              x8(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(apartmentObject.adres!, style: kIndexTitle),
                  y4(),
                  Text('${apartmentObject.postcode!} ${apartmentObject.woonplaats}', style: kIndexLocation),
                  y4(),
                  Text(
                    '€ ${apartmentObject.koopprijs!.toString()}',
                    style: kIndexPrice,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
