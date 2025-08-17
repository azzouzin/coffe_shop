part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoaded extends HomeState {
  final int categorie;
  HomeLoaded(this.categorie);
}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {}
