import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
part 'account_setup_state.dart';

class AccountSetupCubit extends Cubit<AccountSetupState> {
  AccountSetupCubit() : super(AccountSetupInitial());

  static AccountSetupCubit Instanse = AccountSetupCubit();

  TextEditingController nickNameClr = TextEditingController();
  TextEditingController birthDayDNameClr = TextEditingController();
  TextEditingController phoneNumberClr = TextEditingController();
  TextEditingController genderClr = TextEditingController();


  List genders = ['male','female','other'];


  pickImage(ImageSource source, BuildContext context) async {
    await ImagePicker().pickImage(source: source).then((image) async {
      if (image == null) {
        return;
      } else {
        File cropedImage = await cropImage(imageFile: File(image.path));
        emit(AccountSetupIamgeSelected(cropedImage));
      }
    }).catchError((error) {
      print(error);
      emit(AccountSetupIamgeError());
    });
  }

  Future cropImage({required File imageFile}) async{
    CroppedFile? croppedFile =
      await ImageCropper().cropImage(
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          sourcePath: imageFile.path);
    if(croppedFile == null) return null;
    return File(croppedFile.path);
  }


}


