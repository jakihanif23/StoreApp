import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/model/response_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitState()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginButtonPressed) {
        if (event.username.isEmpty || event.password.isEmpty) {
          emit(AuthErrorState());
        } else {
          emit(AuthLoadingState());
          await Future.delayed(const Duration(seconds: 3), (() {
            emit(AuthSuccessState(event.username));
          }));
        }
      }
    });
  }
}
