import 'package:json_annotation/json_annotation.dart';

part 'pagination_req.g.dart';

@JsonSerializable()
class PaginationReq {
  @JsonKey(name: "page")
  int? page;

  @JsonKey(name: "per_page")
  int? rowsPerPage;

  @JsonKey(name: "search")
  String? search;

  PaginationReq({
    this.page,
    this.rowsPerPage,
    this.search,
  });

  PaginationReq copyWith({
    String? search,
  }) {
    return PaginationReq(
      page: page,
      rowsPerPage: rowsPerPage,
      search: search ?? this.search,
    );
  }

  factory PaginationReq.fromJson(Map<String, dynamic> json) =>
      _$PaginationReqFromJson(json);
}
