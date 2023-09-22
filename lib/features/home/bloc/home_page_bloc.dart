import 'package:burgan_core/burgan_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final IComponentsNetworkManager componentsNetworkManager;

  HomePageBloc({required this.componentsNetworkManager}) : super(HomePageStateInitial());
}
