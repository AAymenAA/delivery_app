





import 'package:dilevery_app/core/constant/routes.dart';
import 'package:dilevery_app/core/middleware/my_middleware.dart';
import 'package:dilevery_app/view/screen/orders_details.dart';
import 'package:dilevery_app/view/screen/splash_view.dart';
import 'package:dilevery_app/view/screen/home.dart';
import 'package:dilevery_app/view/screen/language.dart';
import 'package:get/get.dart';

import 'view/screen/auth/login_view.dart';

List<GetPage<dynamic>>? routes = [
  //GetPage(name: "/", page: () => Chekout()),

  GetPage(name: "/" ,page: ()=> const SplashView() ,middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.login, page: ()=> const LoginView()),
  GetPage(name: AppRoute.language, page: ()=> const Language()),


  GetPage(name: AppRoute.Home, page: ()=> const Home()),

  GetPage(name: AppRoute.OrdersDetails, page: ()=> const OrdersDetails()),

];

