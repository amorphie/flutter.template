import 'dart:io';

import 'package:burgankuwait/core/component/component_data.dart';
import 'package:burgankuwait/features/home/network/home_network_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

final baseUrlLocal = Platform.isAndroid ? "http://10.0.2.2:3000" : "http://localhost:3000";

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageStateInitial()) {
    on<HomePageEventFetchComponents>((event, emit) async {
      emit(HomePageStateLoading());
      var response = await HomeNetworkManager(baseUrlLocal).fetchHomePageComponents();
      emit(HomePageStateLoaded(componentsMap: response));
    });
  }
}
