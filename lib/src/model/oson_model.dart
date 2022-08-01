import 'dart:convert';

List<OsonModel> osonModelFromJson(String str) =>
    List<OsonModel>.from(json.decode(str).map((x) => OsonModel.fromJson(x)));

class OsonModel {
  OsonModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.childs,
  });

  int id;
  String name;
  String slug;
  List<OsonModel> childs;

  factory OsonModel.fromJson(Map<String, dynamic> json) => OsonModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        childs: json["childs"] == null
            ? <OsonModel>[]
            : List<OsonModel>.from(
                json["childs"].map((x) => OsonModel.fromJson(x))),
      );
}
