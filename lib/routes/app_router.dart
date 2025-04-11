import 'package:auto_route/auto_route.dart';
import 'package:pulseboard/core/widgets/app_layout_page.dart';
import 'package:pulseboard/features/dashboard/presentation/dashboard_page.dart';
import 'package:pulseboard/features/details/presentation/pages/details_page.dart';
import 'package:pulseboard/features/settings/presentation/pages/settings_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/',
          page: AppLayoutRoute.page,
          children: [
            AutoRoute(
              path: 'dashboard',
              page: DashboardRoute.page,
              initial: true,
            ),
            AutoRoute(
              path: 'details',
              page: DetailsRoute.page,
            ),
            AutoRoute(
              path: 'settings',
              page: SettingsRoute.page,
            ),
          ],
        ),
      ];
}
