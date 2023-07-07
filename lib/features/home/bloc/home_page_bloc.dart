import 'package:bloc/bloc.dart';
import 'package:burgan_poc/core/component/component_data.dart';
import 'package:burgan_poc/features/home/network/home_network_manager.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

const baseUrlLocal = "http://10.0.2.2:3000";

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageStateInitial()) {
    on<HomePageEventFetchComponents>((event, emit) async {
      emit(HomePageStateLoading());
      var response = await HomeNetworkManager(baseUrlLocal).fetchHomePageComponents();
      emit(HomePageStateLoaded(componentList: response.componentList));
    });
  }
}
