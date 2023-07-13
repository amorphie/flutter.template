part of 'sub_navigation_widget_bloc.dart';

sealed class SubNavigationWidgetEvent extends Equatable {
  const SubNavigationWidgetEvent();
}

class SubNavigationWidgetEventFetchComponentDetails extends SubNavigationWidgetEvent {
  @override
  List<Object?> get props => [];

}
