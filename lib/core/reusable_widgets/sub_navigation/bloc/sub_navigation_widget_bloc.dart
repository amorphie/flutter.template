import 'package:burgankuwait/core/reusable_widgets/sub_navigation/models/sub_navigation_component_details.dart';
import 'package:burgankuwait/core/reusable_widgets/sub_navigation/sub_navigation_network_manager.dart';
import 'package:burgankuwait/features/home/bloc/home_page_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sub_navigation_widget_event.dart';

part 'sub_navigation_widget_state.dart';

class SubNavigationWidgetBloc extends Bloc<SubNavigationWidgetEvent, SubNavigationWidgetState> {
  SubNavigationWidgetBloc() : super(SubNavigationWidgetStateLoading()) {
    on<SubNavigationWidgetEventFetchComponentDetails>((event, emit) async {
      final response = await SubNavigationNetworkManager(baseUrlLocal).fetchSubNavigationComponentDetails();
      emit(SubNavigationWidgetStateLoaded(response.componentDetailsList));
    });
  }
}
