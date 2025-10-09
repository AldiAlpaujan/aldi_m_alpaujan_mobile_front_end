import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:aldi_m_alpaujan_mobile_front_end/features/common/presentation/pages/initialization.page.dart';

part 'routes.dart';

/// This class is a configuration of all routes in the application.
/// so the router will be directed to the page
class AppPages {
  static String initial = Routes.initialization;

  static final pages = <GetPage>[
    GetPage(
      name: Routes.initialization,
      page: () => const InitializationPage(),
    ),
  ];
}
