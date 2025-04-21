// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Holiday _$HolidayFromJson(Map<String, dynamic> json) => _Holiday(
  title: json['title'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$HolidayToJson(_Holiday instance) => <String, dynamic>{
  'title': instance.title,
  'date': instance.date?.toIso8601String(),
};
