import 'package:flutter/material.dart';
import 'package:keeb_gallery/models.dart';

class GalleryImage extends StatelessWidget {
  const GalleryImage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final GalleryItemModel model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Stack(
        children: [
          Image.network(model.url),
          Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                Colors.white.withOpacity(0.0),
                Colors.black.withOpacity(0.6)
              ])))),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  model.hashtag,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
