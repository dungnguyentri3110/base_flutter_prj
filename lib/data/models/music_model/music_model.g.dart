// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicModelResponse _$MusicModelResponseFromJson(Map<String, dynamic> json) =>
    MusicModelResponse(
      listMusic:
          (json['listMusic'] as List<dynamic>?)
              ?.map((e) => MusicModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MusicModelResponseToJson(MusicModelResponse instance) =>
    <String, dynamic>{'listMusic': instance.listMusic};

MusicModel _$MusicModelFromJson(Map<String, dynamic> json) => MusicModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$MusicModelToJson(MusicModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
