import 'package:burgan_poc/features/home/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: HomePageBloc()..add(HomePageEventFetchComponents()),
      builder: (context, state) {
        return const Scaffold();
      },
    );
  }
}
