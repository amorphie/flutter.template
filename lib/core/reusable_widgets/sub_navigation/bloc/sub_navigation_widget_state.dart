part of 'sub_navigation_widget_bloc.dart';

sealed class SubNavigationWidgetState extends Equatable {
  const SubNavigationWidgetState();
}

class SubNavigationWidgetStateLoading extends SubNavigationWidgetState {
  @override
  List<Object> get props => [];
}

class SubNavigationWidgetStateLoaded extends SubNavigationWidgetState {
  final List<SubNavigationComponentDetails> componentDetailsList;

  const SubNavigationWidgetStateLoaded(this.componentDetailsList);

  @override
  List<Object> get props => [];
}
