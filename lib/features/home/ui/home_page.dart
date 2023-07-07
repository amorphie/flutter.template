import 'package:burgan_poc/core/component/component_to_widget_mapper.dart';
import 'package:burgan_poc/features/home/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        bloc: HomePageBloc()..add(HomePageEventFetchComponents()),
        builder: (context, state) {
          switch (state) {
            case HomePageStateLoading _:
              return const Center(child: CircularProgressIndicator());
            case HomePageStateLoaded _:
              return Column(
                children: [
                  ...state.componentList.map((component) => ComponentToWidgetMapper().map(componentId: component.id))
                ],
              );
            default:
              return const Scaffold();
          }
        },
      ),
    );
  }
}
