// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

List<VideoModel> videoModelFromJson(String str) => List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromJson(x)));

String videoModelToJson(List<VideoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoModel {
  VideoModel({
    this.id,
    this.title,
    this.name,
    this.description,
    this.content,
    this.tags,
    this.url,
    this.ext,
    this.mime,
    this.alternativeText,
    this.locale,
    this.likeCount,
    this.thumbnail,
    this.slug,
    this.commentCount,
    this.likedByMe,
  });

  String? id;
  String? title;
  String? name;
  dynamic description;
  String? content;
  String? tags;
  String? url;
  String? ext;
  String? mime;
  String? alternativeText;
  String? locale;
  int? likeCount;
  String? thumbnail;
  String? slug;
  int? commentCount;
  bool? likedByMe;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    id: json["id"],
    title: json["title"],
    name: json["name"],
    description: json["description"],
    content: json["content"],
    tags: json["tags"],
    url: json["url"],
    ext: json["ext"],
    mime: json["mime"],
    alternativeText: json["alternativeText"],
    locale: json["locale"],
    likeCount: json["likeCount"],
    thumbnail: json["thumbnail"],
    slug: json["slug"],
    commentCount: json["commentCount"],
    likedByMe: json["likedByMe"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "name": name,
    "description": description,
    "content": content,
    "tags": tags == null ? null : tags,
    "url": url,
    "ext": ext,
    "mime": mime,
    "alternativeText": alternativeText,
    "locale": locale,
    "likeCount": likeCount,
    "thumbnail": thumbnail,
    "slug": slug,
    "commentCount": commentCount,
    "likedByMe": likedByMe,
  };
}
