part of 'account_setup_cubit.dart';

@immutable
abstract class AccountSetupState {}

class AccountSetupInitial extends AccountSetupState {}

class AccountSetupIamgeSelected extends AccountSetupState {
  static late File image;
  AccountSetupIamgeSelected(File selectedImage){
    image = selectedImage;
  }
}

class AccountSetupIamgeError extends AccountSetupState {}

class AccountSetupLoading extends AccountSetupState {}

class AccountSetupSuccess extends AccountSetupState {}

class AccountSetupError extends AccountSetupState {}

