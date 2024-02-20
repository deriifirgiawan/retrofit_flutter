import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  @JsonKey(name: 'author')
  final String? author;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'urlToImage')
  final String? urlToImage;

  @JsonKey(name: 'publishedAt')
  final String? publishedAt;

  @JsonKey(name: 'content')
  final String? content;

  ArticleModel(this.author, this.title, this.description, this.urlToImage,
      this.publishedAt, this.content);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
