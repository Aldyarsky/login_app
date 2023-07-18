import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:login_app/app/auth_provider/auth_provider.dart';
import 'package:login_app/data/models/user.dart';
import 'package:login_app/data/services/network/auth_service.dart';
import 'package:login_app/data/services/service_locator/service_locator.dart';
import 'package:login_app/data/services/shared_prefs/shared_prefs.dart';

part 'login_view_event.dart';
part 'login_view_state.dart';
part 'login_view_bloc.freezed.dart';

class LoginViewBloc extends Bloc<LoginViewEvent, LoginViewState> {
  LoginViewBloc() : super(const _Initial()) {
    on<LoginViewEvent>((event, emit) async {
      await event.when(
        login: (username, password) {
          return _login(emit, username, password);
        },
      );
    });
  }
  final authService = getIt<AuthService>();
  final sharedPrefs = getIt<SharedPrefs>();

  _login(Emitter<LoginViewState> emit, String username, String password) async {
    emit(const LoginViewState.loading());
    try {
      final response =
          await authService.login(email: username, password: password);
      if (response.data['status'] != null) {
        if (response.data['status'] >= 400) {
          emit(LoginViewState.error(response.data['message'].toString()));
          return;
        }
      }
      await getIt<AuthProvider>().setAuthData(
        response.data['tokens']['accessToken'],
        response.data['tokens']['refreshToken'],
        User.fromJson(response.data['user']),
      );
      emit(const LoginViewState.success("Success"));
    } catch (e) {
      emit(
        LoginViewState.error(e.toString()),
      );
    }
  }
}
