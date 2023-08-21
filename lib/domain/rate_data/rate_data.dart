import 'package:json_annotation/json_annotation.dart';

part 'rate_data.g.dart';

@JsonSerializable()
class RateData {
  String? date;
  double? result;

  RateData({this.date, this.result});

  factory RateData.fromJson(Map<String, dynamic> json) {
    return _$RateDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RateDataToJson(this);
}
