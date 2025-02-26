// To parse this JSON data, do
//
//     final DocumentResponse = DocumentResponseFromJson(jsonString);

import 'dart:convert';

DocumentResponse DocumentResponseFromJson(String str) =>
    DocumentResponse.fromJson(json.decode(str));

String DocumentResponseToJson(DocumentResponse data) =>
    json.encode(data.toJson());

class DocumentResponse {
  List<Document>? data;
  Links? links;
  Meta? meta;

  DocumentResponse({
    this.data,
    this.links,
    this.meta,
  });

  factory DocumentResponse.fromJson(Map<String, dynamic> json) =>
      DocumentResponse(
        data: json["data"] == null
            ? []
            : List<Document>.from(json["data"]!.map((x) => Document.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Document {
  int? id;
  String? image;
  String? text;
    String? title;
  String? status;

  Document({
    this.id,
    this.image,
    this.text,
    this.title,
    this.status
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        image: json["image"],
        text: json["text"],
        title: json["title"],
        status: json["status"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "text": text,
        "title": title,
        "status": status
      };
}

// class CompanyId {
//   int? id;
//   String? name;

//   CompanyId({
//     this.id,
//     this.name,
//   });

//   factory CompanyId.fromJson(Map<String, dynamic> json) => CompanyId(
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }

// enum Status { HALAL, HARAM, NO_CONTAMINATION }

// final statusValues = EnumValues({
//   "halal": Status.HALAL,
//   "haram": Status.HARAM,
//   "no-contamination": Status.NO_CONTAMINATION
// });

class Links {
  String? first;
  String? last;
  dynamic prev;
  String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}