import 'package:flutter/material.dart';
import 'package:funda/model/apartment.dart';
import 'package:funda/utils.dart';

class ApartmentMedia extends StatelessWidget {
  final Apartment apartment;

  const ApartmentMedia({Key? key, required this.apartment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (apartment.media == null || apartment.media!.isEmpty) {
      return Container();
    }

    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            children: [
              ...apartment.media!.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Image.network(e.mediaItems!.last.url!),
                );
              }).toList(),
            ],
          ),
          const Positioned(
            left: 0,
            child: Icon(Icons.chevron_left, color: Colors.white, size: 42),
          ),
          const Positioned(
            right: 0,
            child: Icon(Icons.chevron_right, color: Colors.white, size: 42),
          ),
          if (apartment.wGS84Y != null && apartment.wGS84X != null)
            Positioned(
              right: 10,
              bottom: 20,
              child: ElevatedButton(
                onPressed: () async {
                  await openMapFromCoordinates(apartment.wGS84Y!, apartment.wGS84X!);
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(32, 32)),
                child: const Icon(Icons.map_sharp, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
