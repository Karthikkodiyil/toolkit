import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit/view/home_view.dart';
import 'package:toolkit/view_model/home_page_viewmodel.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomePageViewmodel(),
   
    )
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
