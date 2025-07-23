import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(milliseconds: 200));
    emit(Authenticated()); // No auth check, go straight to home
  }
}
