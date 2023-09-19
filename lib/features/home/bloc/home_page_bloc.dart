import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageStateInitial()) {
    on<HomePageEventFetchComponents>((event, emit) async {
      emit(HomePageStateLoading());
      var response = await ComponentsNetworkManager().fetchPageComponentsByPageId("home");
      emit(HomePageStateLoaded(componentsMap: response));
    });
  }
}
