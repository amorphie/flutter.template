import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sub_navigation_widget_event.dart';
part 'sub_navigation_widget_state.dart';

class SubNavigationWidgetBloc extends Bloc<SubNavigationWidgetEvent, SubNavigationWidgetState> {
  SubNavigationWidgetBloc() : super(SubNavigationWidgetStateLoading()) {
    on<SubNavigationWidgetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
