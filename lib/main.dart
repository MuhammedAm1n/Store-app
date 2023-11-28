import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_prototypee/DataLayer/Drc/DataSource.dart';
import 'package:shop_prototypee/DataLayer/Repositry/MainRepo.dart';
import 'package:shop_prototypee/DomainLayer/RAbstractRepositry/AbsRepo.dart';
import 'package:shop_prototypee/DomainLayer/UseCase/UseCaseShop.dart';
import 'package:shop_prototypee/PresenationLayer/Screens/Intro.dart';
import 'package:shop_prototypee/PresenationLayer/Screens/Second.dart';
import 'package:shop_prototypee/PresenationLayer/Screens/Third.dart';

void main() {
  AbsRemoteDataSource _absRemoteDataSource = RemoteDataSource();
  AbstractRepo repo = MainRepo(_absRemoteDataSource);
  runApp(ChangeNotifierProvider(
    create: (context) => UseCaseShop(repo: repo),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const IntroPage(),
      routes: {
        '/introPage': (context) => const IntroPage(),
        '/SecondPage': (context) => const StorePage(),
        '/ThirdPage': (context) => const CartPage()
      },
    );
  }
}
