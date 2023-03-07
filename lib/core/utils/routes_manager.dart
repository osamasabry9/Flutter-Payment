import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/strings_manager.dart';

import '../../features/payment/presentation/pages/ref_code_page.dart';
import '../../features/payment/presentation/pages/register_page.dart';
import '../../features/payment/presentation/pages/toggle_page.dart';
import '../../features/payment/presentation/pages/visa_page.dart';

class Routes {
  static const String registerRoute = '/';
  static const String toggleRoute = '/toggle';
  static const String referenceRoute = '/reference';
  static const String visaRoute = '/visa';
  
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerRoute:
        return routeBuilder(
          RegisterPage(),
        );
      case Routes.toggleRoute:
        return routeBuilder(
          const TogglePage(),
        );
      case Routes.referenceRoute:
        return routeBuilder(
          const ReferencePage(),
        );
      case Routes.visaRoute:
        return routeBuilder(
          const VisaPage(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const NoFoundScreen(),
    );
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoFoundScreen extends StatelessWidget {
  const NoFoundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.noRouteFound,
        ),
      ),
      body: const Center(
        child: Text(
          AppStrings.noRouteFound,
        ),
      ),
    );
  }
}
