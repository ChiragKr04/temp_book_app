import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  String kind;
  int totalItems;
  List<BookItem> items;

  BookModel({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  BookModel copyWith({
    String? kind,
    int? totalItems,
    List<BookItem>? items,
  }) =>
      BookModel(
        kind: kind ?? this.kind,
        totalItems: totalItems ?? this.totalItems,
        items: items ?? this.items,
      );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: json["items"] != null
            ? List<BookItem>.from(
                json["items"].map((x) => BookItem.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

BookItem bookItemFromJson(String str) => BookItem.fromJson(json.decode(str));

class BookItem {
  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SaleInfo saleInfo;
  AccessInfo accessInfo;

  BookItem({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
  });

  BookItem copyWith({
    String? kind,
    String? id,
    String? etag,
    String? selfLink,
    VolumeInfo? volumeInfo,
    SaleInfo? saleInfo,
    AccessInfo? accessInfo,
  }) =>
      BookItem(
        kind: kind ?? this.kind,
        id: id ?? this.id,
        etag: etag ?? this.etag,
        selfLink: selfLink ?? this.selfLink,
        volumeInfo: volumeInfo ?? this.volumeInfo,
        saleInfo: saleInfo ?? this.saleInfo,
        accessInfo: accessInfo ?? this.accessInfo,
      );

  factory BookItem.fromJson(Map<String, dynamic> json) => BookItem(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
      };
}

class AccessInfo {
  String country;
  String viewability;
  bool embeddable;
  bool publicDomain;
  String textToSpeechPermission;
  Epub epub;
  Epub pdf;
  String webReaderLink;
  String accessViewStatus;
  bool quoteSharingAllowed;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  AccessInfo copyWith({
    String? country,
    String? viewability,
    bool? embeddable,
    bool? publicDomain,
    String? textToSpeechPermission,
    Epub? epub,
    Epub? pdf,
    String? webReaderLink,
    String? accessViewStatus,
    bool? quoteSharingAllowed,
  }) =>
      AccessInfo(
        country: country ?? this.country,
        viewability: viewability ?? this.viewability,
        embeddable: embeddable ?? this.embeddable,
        publicDomain: publicDomain ?? this.publicDomain,
        textToSpeechPermission:
            textToSpeechPermission ?? this.textToSpeechPermission,
        epub: epub ?? this.epub,
        pdf: pdf ?? this.pdf,
        webReaderLink: webReaderLink ?? this.webReaderLink,
        accessViewStatus: accessViewStatus ?? this.accessViewStatus,
        quoteSharingAllowed: quoteSharingAllowed ?? this.quoteSharingAllowed,
      );

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

class Epub {
  bool isAvailable;
  String? downloadLink;

  Epub({
    required this.isAvailable,
    required this.downloadLink,
  });

  Epub copyWith({
    bool? isAvailable,
    String? downloadLink,
  }) =>
      Epub(
        isAvailable: isAvailable ?? this.isAvailable,
        downloadLink: downloadLink ?? this.downloadLink,
      );

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        downloadLink: json["downloadLink"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "downloadLink": downloadLink,
      };
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  String? buyLink;
  Price? listPrice;
  Price? retailPrice;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
    required this.buyLink,
    required this.listPrice,
    required this.retailPrice,
  });

  SaleInfo copyWith({
    String? country,
    String? saleability,
    bool? isEbook,
    String? buyLink,
    Price? listPrice,
    Price? retailPrice,
  }) =>
      SaleInfo(
        country: country ?? this.country,
        saleability: saleability ?? this.saleability,
        isEbook: isEbook ?? this.isEbook,
        buyLink: buyLink ?? this.buyLink,
        listPrice: listPrice ?? this.listPrice,
        retailPrice: retailPrice ?? this.retailPrice,
      );

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
        buyLink: json["buyLink"],
        listPrice: json["listPrice"] != null
            ? Price.fromJson(json["listPrice"])
            : null,
        retailPrice: json["retailPrice"] != null
            ? Price.fromJson(json["retailPrice"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
        "buyLink": buyLink,
        "listPrice": listPrice?.toJson(),
        "retailPrice": retailPrice?.toJson(),
      };
}

class VolumeInfo {
  String title;
  String? subtitle;
  String? description;
  List<String> authors;
  String? publishedDate;
  String? publisher;
  List<IndustryIdentifier> industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String> categories;
  double? averageRating;
  double? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publishedDate,
    required this.publisher,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.description,
  });

  VolumeInfo copyWith({
    String? title,
    String? subtitle,
    String? description,
    List<String>? authors,
    String? publishedDate,
    String? publisher,
    List<IndustryIdentifier>? industryIdentifiers,
    ReadingModes? readingModes,
    int? pageCount,
    String? printType,
    List<String>? categories,
    String? maturityRating,
    double? averageRating,
    double? ratingsCount,
    bool? allowAnonLogging,
    String? contentVersion,
    PanelizationSummary? panelizationSummary,
    ImageLinks? imageLinks,
    String? language,
    String? previewLink,
    String? infoLink,
    String? canonicalVolumeLink,
  }) =>
      VolumeInfo(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        description: description ?? this.description,
        authors: authors ?? this.authors,
        publishedDate: publishedDate ?? this.publishedDate,
        publisher: publisher ?? this.publisher,
        averageRating: averageRating ?? this.averageRating,
        ratingsCount: ratingsCount ?? this.ratingsCount,
        industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
        readingModes: readingModes ?? this.readingModes,
        pageCount: pageCount ?? this.pageCount,
        printType: printType ?? this.printType,
        categories: categories ?? this.categories,
        maturityRating: maturityRating ?? this.maturityRating,
        allowAnonLogging: allowAnonLogging ?? this.allowAnonLogging,
        contentVersion: contentVersion ?? this.contentVersion,
        panelizationSummary: panelizationSummary ?? this.panelizationSummary,
        imageLinks: imageLinks ?? this.imageLinks,
        language: language ?? this.language,
        previewLink: previewLink ?? this.previewLink,
        infoLink: infoLink ?? this.infoLink,
        canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
      );

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        authors: json["authors"] != null
            ? List<String>.from(json["authors"].map((x) => x))
            : [],
        publishedDate: json["publishedDate"],
        publisher: json["publisher"],
        averageRating: json["averageRating"] != null
            ? double.parse(json["averageRating"].toString())
            : null,
        ratingsCount: json["ratingsCount"] != null
            ? double.parse(json["ratingsCount"].toString())
            : null,
        industryIdentifiers: json["industryIdentifiers"] != null
            ? List<IndustryIdentifier>.from(json["industryIdentifiers"]
                .map((x) => IndustryIdentifier.fromJson(x)))
            : [],
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"],
        printType: json["printType"],
        categories: json["categories"] != null
            ? List<String>.from(json["categories"].map((x) => x))
            : [],
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] != null
            ? PanelizationSummary.fromJson(json["panelizationSummary"])
            : null,
        imageLinks: json["imageLinks"] != null
            ? ImageLinks.fromJson(json["imageLinks"])
            : null,
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "publishedDate": publishedDate,
        "publisher": publisher,
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "industryIdentifiers":
            List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
        "readingModes": readingModes?.toJson(),
        "pageCount": pageCount,
        "printType": printType,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary?.toJson(),
        "imageLinks": imageLinks?.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class ImageLinks {
  String smallThumbnail;
  String thumbnail;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  ImageLinks copyWith({
    String? smallThumbnail,
    String? thumbnail,
  }) =>
      ImageLinks(
        smallThumbnail: smallThumbnail ?? this.smallThumbnail,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class Price {
  double? amount;
  String currencyCode;

  Price({
    required this.amount,
    required this.currencyCode,
  });

  Price copyWith({
    double? amount,
    String? currencyCode,
  }) =>
      Price(
        amount: amount ?? this.amount,
        currencyCode: currencyCode ?? this.currencyCode,
      );

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"] != null
            ? double.parse(json["amount"].toString())
            : null,
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "thumbnail": currencyCode,
      };
}

class IndustryIdentifier {
  String type;
  String identifier;

  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  IndustryIdentifier copyWith({
    String? type,
    String? identifier,
  }) =>
      IndustryIdentifier(
        type: type ?? this.type,
        identifier: identifier ?? this.identifier,
      );

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
      };
}

class PanelizationSummary {
  bool containsEpubBubbles;
  bool containsImageBubbles;

  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  PanelizationSummary copyWith({
    bool? containsEpubBubbles,
    bool? containsImageBubbles,
  }) =>
      PanelizationSummary(
        containsEpubBubbles: containsEpubBubbles ?? this.containsEpubBubbles,
        containsImageBubbles: containsImageBubbles ?? this.containsImageBubbles,
      );

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

class ReadingModes {
  bool text;
  bool image;

  ReadingModes({
    required this.text,
    required this.image,
  });

  ReadingModes copyWith({
    bool? text,
    bool? image,
  }) =>
      ReadingModes(
        text: text ?? this.text,
        image: image ?? this.image,
      );

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}
