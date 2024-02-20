import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, nullable: true)
class ResponseModel<T> {
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'totalResults')
  final int totalResults;

  @JsonKey(name: 'articles')
  final T? articles;

  ResponseModel(this.status, this.totalResults, this.articles);

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseModelToJson(this, toJsonT);
}
