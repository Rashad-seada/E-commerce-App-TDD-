import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordSMSSelected());

  static ResetPasswordCubit Instanse = ResetPasswordCubit();

  SelectResetMethod(ResetPasswordState state){
   emit(state);
  }



}
