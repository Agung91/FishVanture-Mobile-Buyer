import 'package:flutter/material.dart';

import 'package:app/modules/login/screen/page_login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RouteToPage(
              pageName: 'Login Page',
              page: const LoginPage(),
            )
          ],
        ),
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
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {},
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          )),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(child: Text(pageName)),
      ),
    );
  }
}
