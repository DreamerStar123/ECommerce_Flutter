import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/config/routes.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/screens/categories/categories_screen.dart';
import 'package:openflutterecommerce/screens/favorites/favorites.dart';
import 'package:openflutterecommerce/screens/home/home_screen.dart';
import 'package:openflutterecommerce/screens/signin/forget_password.dart';
import 'package:openflutterecommerce/screens/signin/signup.dart';
import 'package:openflutterecommerce/screens/splash_screen.dart';

import 'authentication/authentication.dart';
import 'config/routes.dart';
import 'screens/home/home_screen.dart';
import 'screens/signin/signin.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) => AuthenticationBloc()..add(AppStarted()),
    child: OpenFlutterEcommerceApp(),
  ));
}

class OpenFlutterEcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open FLutter E-commerce',
      theme: OpenFlutterEcommerceTheme.of(context),
      routes: <String, WidgetBuilder>{
        OpenFlutterEcommerceRoutes.home: (context) => HomeScreen(),
        OpenFlutterEcommerceRoutes.cart: (context) => HomeScreen(),
        OpenFlutterEcommerceRoutes.favourites: (context) => FavouriteScreen(),
        OpenFlutterEcommerceRoutes.SIGNIN: (context) => SignInScreen(),
        OpenFlutterEcommerceRoutes.shop: (context) => CategoriesScreen(),
        OpenFlutterEcommerceRoutes.profile: (context) =>
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
              if (state is Authenticated) {
                return HomeScreen(); //TODO profile properties should be here
              } else if (state is Unauthenticated) {
                return SignUpScreen();
              } else {
                return SplashScreen();
              }
            }),
        OpenFlutterEcommerceRoutes.FORGET_PASSWORD: (context) =>
            ForgetPasswordScreen(),
      },
    );
  }
}
