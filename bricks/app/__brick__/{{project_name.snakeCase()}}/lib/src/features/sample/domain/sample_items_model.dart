import 'package:freezed_annotation/freezed_annotation.dart';

import 'sample_item_entity.dart';

part 'sample_items_model.freezed.dart';

@freezed
@immutable
class SampleItemsModel with _$SampleItemsModel {
  const factory SampleItemsModel({
    required List<SampleItemEntity> items,
  }) = _SampleItemModel;
}
