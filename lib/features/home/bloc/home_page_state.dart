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
  final Map<String, dynamic> componentsMap;

  const HomePageStateLoaded({required this.componentsMap});

  @override
  List<Object> get props => [componentsMap];
}
