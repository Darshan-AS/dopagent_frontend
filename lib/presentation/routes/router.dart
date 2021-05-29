import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/presentation/deposits/deposit_form/deposit_form_page.dart';
import 'package:dopagent_frontend/presentation/orders/order_form/order_form_page.dart';
import 'package:dopagent_frontend/presentation/orders/orders_list/orders_list_page.dart';
import 'package:dopagent_frontend/presentation/sign_in/sign_in_page.dart';
import 'package:dopagent_frontend/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  // generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: OrdersListPage),
    AutoRoute(page: OrderFormPage, fullscreenDialog: false),
    AutoRoute(page: DepositFormPage, fullscreenDialog: false),
  ],
)
class $DopagentRouter {}
