import 'package:auto_route/auto_route.dart';
import 'package:{{project_name.snakeCase()}}/src/app/router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('router', () {
    final tested = AppRouter();

    group('config', () {
      test(
        'defaultRouteType is a RouteType.material.',
        () {
          expect(tested.defaultRouteType, isInstanceOf<MaterialRouteType>());
        },
      );

      test('should contain the correct number of routes.', () {
        expect(tested.routes.length, equals(2));
      });
    });

    group('path', () {
      test('should be correct for WrapperRoute.', () {
        final wrapperRoute = tested.routes[0];
        expect(wrapperRoute.path, equals('/'));
      });
      test('should be correct for SampleItemListRoute.', () {
        final sampleItemListRoute =
            tested.routes[0].children?.routes.toList()[0];
        expect(sampleItemListRoute?.path, equals(''));
      });
      test('should be correct for SampleItemDetailsRoute.', () {
        final sampleItemDetailsRoute =
            tested.routes[0].children?.routes.toList()[1];
        expect(sampleItemDetailsRoute?.path, equals('sample-item'));
      });
      test('should be correct for SettingsRoute.', () {
        final settingsRoute = tested.routes[0].children?.routes.toList()[2];
        expect(settingsRoute?.path, equals('settings'));
      });
      test('should redirect on 404', () {
        final redirectRoute = tested.routes[1];
        expect(redirectRoute.path, equals('/*'));
      });
    });
  });
}
