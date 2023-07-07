part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class HomePageEventFetchComponents extends HomePageEvent {
  @override
  List<Object?> get props => [];
}
