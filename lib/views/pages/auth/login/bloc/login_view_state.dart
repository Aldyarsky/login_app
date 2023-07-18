part of 'login_view_bloc.dart';

@freezed
class LoginViewState with _$LoginViewState {
  const factory LoginViewState.initial() = _Initial;
  const factory LoginViewState.loading() = _Loading;
  const factory LoginViewState.success(String message) = _Success;
  const factory LoginViewState.error(String message) = _Error;
}
