{{#use_serverpod}}import 'package:{{project_name.snakeCase}}_client/{{project_name.snakeCase}}_client.dart';
{{/use_serverpod}}import 'package:freezed_annotation/freezed_annotation.dart';

{{^use_serverpod}}import 'sample_item_entity.dart';
{{/use_serverpod}}
part 'sample_items_model.freezed.dart';

@freezed
@immutable
class SampleItemsModel with _$SampleItemsModel {
  const factory SampleItemsModel({
    required List<SampleItemEntity> items,
  }) = _SampleItemModel;
}
