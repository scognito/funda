import 'package:flutter/material.dart';
import 'package:funda/model/apartment.dart';
import 'package:funda/styles.dart';
import 'package:funda/widget/commons.dart';

class ApartmentInfo extends StatelessWidget {
  final Apartment apartment;

  const ApartmentInfo({Key? key, required this.apartment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(apartment.adres, style: kStyleTitle),
        y8(),
        Text('${apartment.postcode} ${apartment.plaats}', style: kStyleParagraphP2.copyWith(color: Colors.black54)),
        y8(),
        Text('€ ${apartment.koopPrijs.toString()}', style: kStyleParagraphTitle),
        y8(),
        separator(),
        Text(apartment.volledigeOmschrijving ?? '', style: kStyleParagraph)
      ],
    );
  }
}
