part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class LogoutSuccessState extends LayoutState {}

class GetUserErrorState extends LayoutState {
  final String error;

  GetUserErrorState(this.error);
}
