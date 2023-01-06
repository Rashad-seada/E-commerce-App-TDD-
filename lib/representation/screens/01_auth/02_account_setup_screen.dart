import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../config/app_theme.dart';
import '../../blocs/account_setup/account_setup_cubit.dart';
import '../../widgets/custom_back_bottun.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/date_picker.dart';
import '../../widgets/drop_down_list.dart';
import '../../widgets/main_button.dart';
import '../../widgets/phone_number_input_field.dart';
import '../../widgets/profile_image_piker.dart';

class AccountSetupScreen extends StatelessWidget {
  AccountSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("${AccountSetupCubit.Instanse.genderClr.text}..1");


    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 3.3.h,),

                CustomBackButton(title: 'Fill Your Profile',),
                SizedBox(height: 3.5.h,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [

                      ProfileImagePiker(context,),
                      SizedBox(height: 3.2.h,),

                      Form(
                          child: Column(
                            children: [

                              CustomTextField(
                                controller: AccountSetupCubit.Instanse.nickNameClr,
                                keyboardType: TextInputType.text,
                                hintText:'Nickname',
                                textInputAction: TextInputAction.next,

                              ),
                              SizedBox(height: 2.5.h,),

                              CustomTextField(
                                controller: AccountSetupCubit.Instanse.birthDayDNameClr,
                                keyboardType: TextInputType.none,
                                hintText:'Date of Birth',
                                textInputAction: TextInputAction.next,
                                onTap: (){
                                  datePicker(context, AccountSetupCubit.Instanse.birthDayDNameClr);
                                },
                                suffixIcon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,),),
                              SizedBox(height: 2.5.h,),


                              PhoneNumberInputField(
                                controller: AccountSetupCubit.Instanse.phoneNumberClr,
                              ),
                              SizedBox(height: 2.5.h,),

                              DropDownList(
                                  items: AccountSetupCubit.Instanse.genders,
                                  controller: AccountSetupCubit.Instanse.genderClr,
                                  hintext: 'Gender',
                              ),
                              SizedBox(height: 10.h,),

                            ],
                          )
                      ),

                      MainButton(
                        color: AppTheme.activeClr(context),
                        onTap: (){
                          print('${AccountSetupCubit.Instanse.nickNameClr} and \n'
                              ' ${AccountSetupCubit.Instanse.genderClr} and \n'
                              ' ${AccountSetupCubit.Instanse.birthDayDNameClr} and \n'
                              ' ${AccountSetupCubit.Instanse.phoneNumberClr}');
                        },
                        lable: CustomText(
                          text: 'Continue',
                          size: 16,
                          color: AppTheme.primClr(context),
                          fontWeight: FontWeight.w600,

                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

