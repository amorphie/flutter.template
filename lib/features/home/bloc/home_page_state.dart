part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageStateInitial extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageStateLoading extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageStateLoaded extends HomePageState {
  final List<ComponentData> componentList;

  const HomePageStateLoaded({required this.componentList});

  @override
  List<Object> get props => [componentList];
}
