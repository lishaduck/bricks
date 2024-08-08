import '../../../utils/client.dart';

/// A repository for authentication.
abstract interface class SampleItemsRepository {
  /// Authenticate the user.
  Future<List<SampleItemEntity>> fetchItems();
}

/// The default implementation of [SampleItemsRepository].
class _ServerpodSampleItemsRepository implements SampleItemsRepository {
  @override
  Future<List<SampleItemEntity>> fetchItems() async {
    final client = ref.watch(clientProvider);

    return await client.example.items();
  }
}

@riverpod
SampleItemsRepository sampleItemsRepository() {
  return _ServerpodSampleItemsRepository();
}
