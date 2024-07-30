import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../app/router.dart';
import '../../application/sample_items_service.dart';

/// Displays a list of SampleItems.
@RoutePage()
class SampleItemsListPage extends ConsumerWidget {
  const SampleItemsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(sampleItemsServiceProvider).items;

    // To work with lists that may contain a large number of items, it’s best
    // to use the ListView.builder constructor.
    //
    // In contrast to the default ListView constructor, which requires
    // building all Widgets up front, the ListView.builder constructor lazily
    // builds Widgets as they’re scrolled into view.
    return ListView.builder(
      // Providing a restorationId allows the ListView to restore the
      // scroll position when a user leaves and returns to the app after it
      // has been killed while running in the background.
      restorationId: 'sampleItemListView',
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        final title = 'SampleItem ${item.id}';

        return ListTile(
          title: Text(title),
          leading: Semantics(
            label: title,
            child: CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: Assets.icons.logo.provider(),
            ),
          ),
          onTap: () async {
            // Navigate to the details page. If the user leaves and returns to
            // the app after it has been killed while running in the
            // background, the navigation stack is restored.
            await context.router.push(const SampleItemDetailsRoute());
          },
        );
      },
    );
  }
}
