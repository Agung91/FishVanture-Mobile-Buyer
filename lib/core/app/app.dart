import 'package:flutter/material.dart';

import 'package:app/core/route/bloc_route.dart';
import 'package:app/core/route/route_page.dart';
import 'package:app/modules/login/screen/page_login.dart';
import 'package:app/modules/register/screen/page_register.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}


class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [routeObserver],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: AppPage(navigatorKey: _navigatorKey),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({
    Key? key,
    required GlobalKey<NavigatorState> navigatorKey,
  })  : _navigatorKey = navigatorKey,
        super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return RouteBloc().pop();
      },
      child: StreamBuilder<List<RoutePage>>(
          stream: RouteBloc().pages.stream,
          initialData: RouteBloc().pages.value,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return Navigator(
                key: _navigatorKey,
                observers: [HeroController()],
                pages: const [
                  MaterialPage(child: UiPage()),
                ],
                onPopPage: (route, result) {
                  return route.didPop(result);
                },
              );
            }
            return Navigator(
              key: _navigatorKey,
              observers: [HeroController()],
              pages: data.map((e) => e.page).toList(),
              onPopPage: (route, result) {
                return route.didPop(result);
              },
            );
          }),
    );
  }
}

class UiPage extends StatelessWidget {
  const UiPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RouteToPage(
            pageName: 'Register Page',
            page: RouteRegister(),
          ),
          RouteToPage(
            pageName: 'Login Page',
            page: RouteLogin(),
          ),
          RouteToPage(
            pageName: 'Dashboard Page',
            page: RouteDashboard(),
          ),
        ],
      ),
    );
  }
}

class RouteToPage extends StatelessWidget {
  const RouteToPage({
    Key? key,
    required this.pageName,
    required this.page,
  }) : super(key: key);

  final String pageName;
  final RoutePage page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {},
      onTap: () => RouteBloc().push(page),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(child: Text(pageName)),
      ),
    );
  }
}
