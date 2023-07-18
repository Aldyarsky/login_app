part of 'login_view_bloc.dart';

@freezed
class LoginViewEvent with _$LoginViewEvent {
  const factory LoginViewEvent.login(String username, String password) = _Login;
}
