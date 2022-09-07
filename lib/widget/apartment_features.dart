import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:funda/model/apartment.dart';
import 'package:funda/styles.dart';
import 'package:funda/widget/commons.dart';

class ApartmentFeatures extends StatelessWidget {
  final Apartment apartment;

  const ApartmentFeatures({Key? key, required this.apartment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        y24(),
        const Text('Features', style: kStyleParagraphTitle),
        y8(),
        if (apartment.kenmerken != null && apartment.kenmerken!.isNotEmpty)
          ...apartment.kenmerken!.map((e) => Section(characteristic: e)).toList()
      ],
    );
  }
}

class Section extends StatelessWidget {
  final Characteristic characteristic;

  const Section({Key? key, required this.characteristic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        y8(),
        Text(characteristic.titel ?? '', style: kStyleParagraphSubtitle),
        separator(padding: false),
        if (characteristic.kenmerken != null && characteristic.kenmerken!.isNotEmpty)
          ...characteristic.kenmerken!
              .map((e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.naam, style: kStyleFeatureTitle),
                      y4(),
                      Html(
                        data: e.waarde,
                        style: {'body': Style(color: const Color(0xff000000), fontSize: FontSize.em(1.1))},
                      ),
                      separator(padding: false),
                    ],
                  ))
              .toList()
      ],
    );
  }
}
