import 'package:burgankuwait/features/home/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

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
              return JsonWidgetData.fromDynamic(state.componentsMap)?.build(
                    context: context,
                  ) ??
                  const SizedBox.shrink();
            default:
              return const Scaffold();
          }
        },
      ),
    );
  }
}
