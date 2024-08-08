{{#use_serverpod}}import 'package:{{project_name.snakeCase()}}_client/{{project_name.snakeCase()}}_client.dart';
{{/use_serverpod}}import 'package:riverpod_annotation/riverpod_annotation.dart';

{{#use_serverpod}}import '../data/sample_items_repository.dart';
{{/use_serverpod}}{{^use_serverpod}}import '../domain/sample_item_entity.dart';
{{/use_serverpod}}import '../domain/sample_items_model.dart';

part 'sample_items_service.g.dart';

@riverpod
class SampleItemsService extends _$SampleItemsService {
  @override
  Future<SampleItemsModel> build() async {
    {{#use_serverpod}}final sampleItemsRepository = ref.read(sampleItemsRepositoryProvider);
    final items = await sampleItemsRepository.fetchItems();

    return SampleItemsModel(
      items: items,
    );{{/use_serverpod}}{{^use_serverpod}}return const SampleItemsModel(
      items: [
        SampleItemEntity(1),
        SampleItemEntity(2),
        SampleItemEntity(3),
      ],
    );
{{/use_serverpod}}  }
}
