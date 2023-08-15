import 'package:app/core/app/app.dart';
import 'package:app/modules/dashboard/screen/page_dashboard.dart';
import 'package:app/modules/home/screen/page_home.dart';
import 'package:app/modules/login/screen/page_login.dart';
import 'package:app/modules/pond/model/model_pond.dart';
import 'package:app/modules/pond/screen/page_pond.dart';
import 'package:app/modules/register/screen/page_register.dart';
import 'package:flutter/material.dart';

abstract class RoutePage {
  final MaterialPage page;
  final bool isProtected;
  final String name;
  RoutePage(this.page, this.name, {this.isProtected = false});
}

// class RouteUiPage extends RoutePage {
//   RouteUiPage()
//       : super(
//           const MaterialPage(child: UiPage()),
//           'UI PAGE',
//         );
// }

class RouteLogin extends RoutePage {
  RouteLogin()
      : super(
          const MaterialPage(child: LoginPage()),
          'login',
        );
}

class RouteRegister extends RoutePage {
  RouteRegister()
      : super(
          const MaterialPage(child: RegisterPage()),
          'register',
        );
}

class RouteDashboard extends RoutePage {
  RouteDashboard()
      : super(
          const MaterialPage(child: DashboardPage()),
          'home',
        );
}

class RoutePond extends RoutePage {
  RoutePond(PondModel pondModel)
      : super(
          MaterialPage(
              child: PondPage(
            pondModel: pondModel,
          )),
          'pond',
        );
}
