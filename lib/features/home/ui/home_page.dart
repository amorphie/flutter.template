import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/features/home/bloc/home_page_bloc.dart';
import 'package:burgankuwait/features/home/routing/home_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return BrgComponentTreeBuilder(
            componentsNetworkManager: context.read<HomePageBloc>().componentsNetworkManager,
            pageId: HomePageRoute.path,
          );
        },
      ),
    );
  }
}
