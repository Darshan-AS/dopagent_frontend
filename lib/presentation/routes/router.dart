import 'package:auto_route/auto_route_annotations.dart';
import 'package:dopagent_frontend/presentation/deposits/deposit_form/deposit_form_page.dart';
import 'package:dopagent_frontend/presentation/deposits/deposits_list/deposits_list_page.dart';
import 'package:dopagent_frontend/presentation/orders/orders_form/orders_form_page.dart';
import 'package:dopagent_frontend/presentation/orders/orders_list/orders_list_page.dart';
import 'package:dopagent_frontend/presentation/sign_in/sign_in_page.dart';
import 'package:dopagent_frontend/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: OrdersListPage),
    MaterialRoute(page: OrderFormPage, fullscreenDialog: false),
    MaterialRoute(page: DepositsListPage),
    MaterialRoute(page: DepositFormPage, fullscreenDialog: false),
  ],
)
class $AutoRouter {}
