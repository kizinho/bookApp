import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteModel {
  FavouriteModel(
      {this.title,
      this.bookId,
      this.userId,
      this.image,
      this.rating,
      this.author,
      this.category,
      this.publishedDate,
      this.description,
      this.buy,
      this.available,
      this.amount,
      this.url,
      this.preview});

  String? title;
  String? bookId;
  String? userId;
  String? image;
  final rating;
  List<String>? author;
  List<String>? category;
  String? publishedDate;
  String? description;
  String? buy;
  String? available;
  String? amount;
  String? url;
  String? preview;

  factory FavouriteModel.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return FavouriteModel(
      title: doc.data()!["title"],
      bookId: doc.data()!["bookId"],
      userId: doc.data()!["userId"],
      image: doc.data()!["image"],
      rating: doc.data()!["rating"] == null ? null : doc.data()!["rating"],
      author: doc.data()!["author"] == null
          ? ['Unknown']
          : List<String>.from(doc.data()!["author"].map((x) => x)),
      category: doc.data()!["category"] == null
          ? null
          : List<String>.from(doc.data()!["category"].map((x) => x)),
      publishedDate: doc.data()!["publishedDate"],
      description: doc.data()!["description"] == null
          ? 'Unknown'
          : doc.data()!["description"],
      buy: doc.data()!["buy"] == null ? null : doc.data()!["buy"],
      available:
          doc.data()!["available"] == null ? null : doc.data()!["available"],
      amount: doc.data()!["amount"] == null ? null : doc.data()!["amount"],
      url: doc.data()!["url"] == null ? null : doc.data()!["url"],
      preview: doc.data()!["preview"] == null ? null : doc.data()!["preview"],
    );
  }
}
