import 'package:auto_route/auto_route.dart';

import '../features/sample/presentation/items/sample_item_details_page.dart';
import '../features/sample/presentation/items/sample_items_list_page.dart';
import '../features/settings/presentation/preferences/settings_page.dart';
import 'wrapper_page.dart';

part 'router.gr.dart';

/// The router for the application.
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  /// Create a new instance of [AppRouter].
  AppRouter();

  @override
  final defaultRouteType = const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WrapperRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: SampleItemsListRoute.page,
              path: '',
              title: (context, data) => 'Sample Items',
              initial: true,
            ),
            AutoRoute(
              page: SampleItemDetailsRoute.page,
              path: 'sample-item',
              title: (context, data) => 'Item Details',
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: 'settings',
              title: (context, data) => 'Settings',
            ),
          ],
        ),
        RedirectRoute(path: '/*', redirectTo: '/'),
      ];
}
