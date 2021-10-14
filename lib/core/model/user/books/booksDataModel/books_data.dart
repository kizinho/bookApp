class BooksData {
  BooksData({
    this.kind,
    this.totalItems,
    this.items,
  });

  String? kind;
  int? totalItems;
  List<Item>? items;

  factory BooksData.fromJson(Map<String, dynamic> json) => BooksData(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  Kind? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: kindValues.map[json["kind"]],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null
            ? null
            : SearchInfo.fromJson(json["searchInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo!.toJson(),
        "saleInfo": saleInfo!.toJson(),
        "accessInfo": accessInfo!.toJson(),
        "searchInfo": searchInfo == null ? null : searchInfo!.toJson(),
      };
}

class AccessInfo {
  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  Country? country;
  Viewability? viewability;
  bool? embeddable;
  bool? publicDomain;
  TextToSpeechPermission? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  AccessViewStatus? accessViewStatus;
  bool? quoteSharingAllowed;

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: countryValues.map[json["country"]],
        viewability: viewabilityValues.map[json["viewability"]],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission:
            textToSpeechPermissionValues.map[json["textToSpeechPermission"]],
        epub: Epub.fromJson(json["epub"]),
        pdf: Pdf.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "viewability": viewabilityValues.reverse[viewability],
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission":
            textToSpeechPermissionValues.reverse[textToSpeechPermission],
        "epub": epub!.toJson(),
        "pdf": pdf!.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

enum AccessViewStatus { SAMPLE, NONE, FULL_PUBLIC_DOMAIN }

final accessViewStatusValues = EnumValues({
  "FULL_PUBLIC_DOMAIN": AccessViewStatus.FULL_PUBLIC_DOMAIN,
  "NONE": AccessViewStatus.NONE,
  "SAMPLE": AccessViewStatus.SAMPLE
});

enum Country { CH }

final countryValues = EnumValues({"CH": Country.CH});

class Epub {
  Epub({
    this.isAvailable,
    this.acsTokenLink,
    this.downloadLink,
  });

  bool? isAvailable;
  String? acsTokenLink;
  String? downloadLink;

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink:
            json["acsTokenLink"] == null ? null : json["acsTokenLink"],
        downloadLink:
            json["downloadLink"] == null ? null : json["downloadLink"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink == null ? null : acsTokenLink,
        "downloadLink": downloadLink == null ? null : downloadLink,
      };
}

class Pdf {
  Pdf({
    this.isAvailable,
    this.acsTokenLink,
  });

  bool? isAvailable;
  String? acsTokenLink;

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        isAvailable: json["isAvailable"],
        acsTokenLink:
            json["acsTokenLink"] == null ? null : json["acsTokenLink"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink == null ? null : acsTokenLink,
      };
}

enum TextToSpeechPermission { ALLOWED }

final textToSpeechPermissionValues =
    EnumValues({"ALLOWED": TextToSpeechPermission.ALLOWED});

enum Viewability { PARTIAL, NO_PAGES, ALL_PAGES }

final viewabilityValues = EnumValues({
  "ALL_PAGES": Viewability.ALL_PAGES,
  "NO_PAGES": Viewability.NO_PAGES,
  "PARTIAL": Viewability.PARTIAL
});

enum Kind { BOOKS_VOLUME }

final kindValues = EnumValues({"books#volume": Kind.BOOKS_VOLUME});

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  Country? country;
  Saleability? saleability;
  bool? isEbook;
  SaleInfoListPrice? listPrice;
  SaleInfoListPrice? retailPrice;
  String? buyLink;
  List<Offer>? offers;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: countryValues.map[json["country"]],
        saleability: saleabilityValues.map[json["saleability"]],
        isEbook: json["isEbook"],
        listPrice: json["listPrice"] == null
            ? null
            : SaleInfoListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : SaleInfoListPrice.fromJson(json["retailPrice"]),
        buyLink: json["buyLink"] == null ? null : json["buyLink"],
        offers: json["offers"] == null
            ? null
            : List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "saleability": saleabilityValues.reverse[saleability],
        "isEbook": isEbook,
        "listPrice": listPrice == null ? null : listPrice!.toJson(),
        "retailPrice": retailPrice == null ? null : retailPrice!.toJson(),
        "buyLink": buyLink == null ? null : buyLink,
        "offers": offers == null
            ? null
            : List<dynamic>.from(offers!.map((x) => x.toJson())),
      };
}

class SaleInfoListPrice {
  SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  double? amount;
  String? currencyCode;

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) =>
      SaleInfoListPrice(
        amount: json["amount"].toDouble(),
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
}

class Offer {
  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
    this.giftable,
  });

  int? finskyOfferType;
  OfferListPrice? listPrice;
  OfferListPrice? retailPrice;
  bool? giftable;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: OfferListPrice.fromJson(json["retailPrice"]),
        giftable: json["giftable"],
      );

  Map<String, dynamic> toJson() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice!.toJson(),
        "retailPrice": retailPrice!.toJson(),
        "giftable": giftable,
      };
}

class OfferListPrice {
  OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  int? amountInMicros;
  String? currencyCode;

  factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCode,
      };
}

enum Saleability { FOR_SALE, NOT_FOR_SALE, FREE }

final saleabilityValues = EnumValues({
  "FOR_SALE": Saleability.FOR_SALE,
  "FREE": Saleability.FREE,
  "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class SearchInfo {
  SearchInfo({
    this.textSnippet,
  });

  String? textSnippet;

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.subtitle,
  });

  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  PrintType? printType;
  List<String>? categories;
  final averageRating;
  int? ratingsCount;
  MaturityRating? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  Language? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  String? subtitle;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: json["authors"] == null
            ? ['Unknown']
            : List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"] == null ? null : json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"] == null ? 'Unknown' : json["description"],
        industryIdentifiers: json["industryIdentifiers"] == null ? null : List<IndustryIdentifier>.from(
            json["industryIdentifiers"]
                .map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        printType: printTypeValues.map[json["printType"]],
        categories: json["categories"] == null
            ? null
            : List<String>.from(json["categories"].map((x) => x)),
        averageRating:
            json["averageRating"] == null ? null : json["averageRating"],
        ratingsCount:
            json["ratingsCount"] == null ? null : json["ratingsCount"],
        maturityRating: json["maturityRating"]  == null ? null :maturityRatingValues.map[json["maturityRating"]],
        allowAnonLogging: json["allowAnonLogging"] == null ? null : json["allowAnonLogging"],
        contentVersion: json["contentVersion"] == null ? null :json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null
            ? null
            : PanelizationSummary.fromJson(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null ? null :ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"] == null ? null :languageValues.map[json["language"]],
        previewLink: json["previewLink"] == null ? null : json["previewLink"],
        infoLink: json["infoLink"] == null ? null :json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors":
            authors == null ? 'unKnown' : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher == null ? null : publisher,
        "publishedDate": publishedDate,
        "description": description == null ? null : description,
        "industryIdentifiers":
            List<dynamic>.from(industryIdentifiers!.map((x) => x.toJson())),
        "readingModes": readingModes!.toJson(),
        "pageCount": pageCount == null ? null : pageCount,
        "printType": printTypeValues.reverse[printType],
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x)),
        "averageRating": averageRating == null ? null : averageRating,
        "ratingsCount": ratingsCount == null ? null : ratingsCount,
        "maturityRating": maturityRatingValues.reverse[maturityRating],
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary":
            panelizationSummary == null ? null : panelizationSummary!.toJson(),
        "imageLinks": imageLinks!.toJson(),
        "language": languageValues.reverse[language],
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
        "subtitle": subtitle == null ? null : subtitle,
      };
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  String? smallThumbnail;
  String? thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  Type? type;
  String? identifier;

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: typeValues.map[json["type"]],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "identifier": identifier,
      };
}

enum Type { ISBN_13, ISBN_10, OTHER }

final typeValues = EnumValues(
    {"ISBN_10": Type.ISBN_10, "ISBN_13": Type.ISBN_13, "OTHER": Type.OTHER});

enum Language { DE, EN }

final languageValues = EnumValues({"de": Language.DE, "en": Language.EN});

enum MaturityRating { NOT_MATURE }

final maturityRatingValues =
    EnumValues({"NOT_MATURE": MaturityRating.NOT_MATURE});

class PanelizationSummary {
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

enum PrintType { BOOK }

final printTypeValues = EnumValues({"BOOK": PrintType.BOOK});

class ReadingModes {
  ReadingModes({
    this.text,
    this.image,
  });

  bool? text;
  bool? image;

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap;
  }
}
