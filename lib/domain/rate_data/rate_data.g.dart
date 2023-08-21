// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateData _$RateDataFromJson(Map<String, dynamic> json) => RateData(
      date: json['date'] as String?,
      result: (json['result'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RateDataToJson(RateData instance) => <String, dynamic>{
      'date': instance.date,
      'result': instance.result,
    };
