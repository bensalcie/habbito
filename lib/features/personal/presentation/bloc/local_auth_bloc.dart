import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

part 'local_auth_event.dart';
part 'local_auth_state.dart';

@injectable
class LocalAuthBloc extends Bloc<LocalAuthEvent, LocalAuthState> {
  LocalAuthBloc() : super(LocalAuthInitial()) {
    on<VerifyUser>(_onGetLocalAuth);
  }

  _onGetLocalAuth(VerifyUser event, Emitter<LocalAuthState> emit) async {
    try {
      emit(LocalAuthLoading());
      final LocalAuthentication auth = LocalAuthentication();

      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();

      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (availableBiometrics.isNotEmpty) {
        // Some biometrics are enrolled.

        if (availableBiometrics.contains(BiometricType.strong) ||
            availableBiometrics.contains(BiometricType.face)) {
          // Specific types of biometrics are available.
          // Use checks like this with caution!

          if (canAuthenticate) {
            try {
              final bool didAuthenticate = await auth.authenticate(
                  localizedReason:
                      'Please authenticate to add / View Personal Habbit Information ');

              emit(didAuthenticate
                  ? const LocalAuthSuccess(
                      response: 'User Successfully Authenticated')
                  : const LocalAuthFailed(
                      errorMessage: 'Something went wrong'));
            } on PlatformException catch (e) {
              emit(const LocalAuthFailed(
                  errorMessage:
                      'Something went wrong establishing Biometrics'));

              if (e.code == auth_error.notAvailable) {
                emit(const LocalAuthFailed(
                    errorMessage: 'No Auth Options on this device'));
                // Add handling of no hardware here.
              } else if (e.code == auth_error.notEnrolled) {
                emit(const LocalAuthFailed(
                    errorMessage: 'No Auth Options on this device'));
              } else {
                emit(const LocalAuthFailed(
                    errorMessage:
                        'Something went wrong establishing Biometrics'));
              }
            }
          } else {
            emit(const LocalAuthFailed(errorMessage: 'Something went wrong'));
          }
        }
      } else {
        emit(const LocalAuthFailed(
            errorMessage: 'No Authentication options setup on your Device'));
      }
    } catch (e) {
      emit(const LocalAuthFailed(
          errorMessage:
              'Something went wrong establishing Authentication on this device'));
    }
  }
}
