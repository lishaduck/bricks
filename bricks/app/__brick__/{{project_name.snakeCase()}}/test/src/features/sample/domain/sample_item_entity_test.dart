{{#use_serverpod}}import 'package:{{project_name.snakeCase()}}_client/{{project_name.snakeCase()}}_client.dart';
{{/use_serverpod}}{{^use_serverpod}}import 'package:{{project_name.snakeCase()}}/src/features/sample/domain/sample_item_entity.dart';
{{/use_serverpod}}import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SampleItemEntity should correctly wrap an int', () {
    const entity = SampleItemEntity(1);
    expect(entity, isA<int>());
    expect(entity, equals(1));
  });
}
