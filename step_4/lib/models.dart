import 'package:flutter/cupertino.dart';

class GalleryItemModel {
  int id;
  String hashtag;
  String url;

  GalleryItemModel(this.id, this.hashtag, this.url);
}

String getProfileImage() {
  return "https://firebasestorage.googleapis.com/v0/b/flutter-workshop-3f555.appspot.com/o/keeb_gallery%2Fprofile.png?alt=media";
}

List<GalleryItemModel> fetchGalleryItem() {
  return [
    GalleryItemModel(0, "Item 1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-workshop-3f555.appspot.com/o/keeb_gallery%2F1.jpg?alt=media"),
    GalleryItemModel(1, "Item 2",
        "https://firebasestorage.googleapis.com/v0/b/flutter-workshop-3f555.appspot.com/o/keeb_gallery%2F2.jpg?alt=media"),
    GalleryItemModel(2, "Item 3",
        "https://firebasestorage.googleapis.com/v0/b/flutter-workshop-3f555.appspot.com/o/keeb_gallery%2F3.jpg?alt=media"),
    GalleryItemModel(3, "Item 4",
        "https://firebasestorage.googleapis.com/v0/b/flutter-workshop-3f555.appspot.com/o/keeb_gallery%2F4.jpg?alt=media"),
    GalleryItemModel(4, "Item 5",
        "https://firebasestorage.googleapis.com/v0/b/flutter-workshop-3f555.appspot.com/o/keeb_gallery%2F5.jpg?alt=media"),
    GalleryItemModel(5, "Item 6",
        "https://firebasestorage.googleapis.com/v0/b/flutter-workshop-3f555.appspot.com/o/keeb_gallery%2F6.jpg?alt=media"),
  ];
}

enum DisplayMode {
  gallery, saved
}
