import 'package:dize/data/data_source/shared_preference.dart';
import 'package:dize/data/repository/dize_repository.dart';
import 'package:dize/presentation/bloc/dize/dize_bloc.dart';
import 'package:dize/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.instance.initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DizeBloc(DizeRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dize',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
