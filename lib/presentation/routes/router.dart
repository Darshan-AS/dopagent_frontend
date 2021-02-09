import 'package:auto_route/auto_route_annotations.dart';
import 'package:dopagent_frontend/presentation/installments/installments_list/installments_list_page.dart';
import 'package:dopagent_frontend/presentation/sign_in/sign_in_page.dart';
import 'package:dopagent_frontend/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: InstallmentsListPage),
  ],
)
class $AutoRouter {}
