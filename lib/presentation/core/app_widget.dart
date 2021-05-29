import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/auth/auth_bloc.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:dopagent_frontend/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  final _router = DopagentRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authStatusRequested()),
        )
      ],
      child: getMaterialApp(),
    );
  }

  MaterialApp getMaterialApp() {
    // final materialApp = MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   home:
    //       Container(), // TODO: Temp solution to avoid key issue in ExtendedNavigator
    //   theme: ThemeData.light().copyWith(
    //     primaryColor: Colors.green[800],
    //     accentColor: Colors.blueAccent,
    //     floatingActionButtonTheme: FloatingActionButtonThemeData(
    //       backgroundColor: Colors.blue[900],
    //     ),
    //     inputDecorationTheme: InputDecorationTheme(
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    //     ),
    //   ),
    // );
    return MaterialApp.router(
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    );
  }
}
