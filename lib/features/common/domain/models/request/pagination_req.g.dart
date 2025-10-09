// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationReq _$PaginationReqFromJson(Map<String, dynamic> json) =>
    PaginationReq(
      page: (json['page'] as num?)?.toInt(),
      rowsPerPage: (json['per_page'] as num?)?.toInt(),
      search: json['search'] as String?,
    );

Map<String, dynamic> _$PaginationReqToJson(PaginationReq instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.rowsPerPage,
      'search': instance.search,
    };
