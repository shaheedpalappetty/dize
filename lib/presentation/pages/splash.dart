import 'package:dize/presentation/bloc/dize/dize_bloc.dart';
import 'package:dize/presentation/pages/home_page.dart';
import 'package:dize/utils/dize_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final dheight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: Container(
          height: dheight * .2,
          width: dheight * .2,
          decoration: BoxDecoration(
              color: DizeColors.purple,
              image: const DecorationImage(
                  image: AssetImage('assets/dize-logo.png'))),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    context.read<DizeBloc>().add(FetchDataEvent());
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
  }
}
