import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  void loadSplash() {
    emit(SplashLoading());
    // Simulate a network call or some loading process
    Future.delayed(Duration(seconds: 5), () {
      emit(SplashLoaded());
      print("Splash loaded and the state is now SplashLoaded");
    });
  }
}
