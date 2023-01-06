import 'package:evira/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_theme.dart';
import '../blocs/account_setup/account_setup_cubit.dart';
import 'custom_buttom_sheet.dart';
import 'custom_text.dart';
import 'image_pick_option.dart';

class ProfileImagePiker extends StatelessWidget {
  BuildContext context;
  GestureTapCallback? onTap;

  ProfileImagePiker(this.context, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap;
        showCustomBottomSheet(
            context,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ImagePickOption(
                          context,
                          text: 'Gallery',
                          icon: Icons.photo,
                          onTap: (){
                            context.read<AccountSetupCubit>().pickImage(ImageSource.gallery, context);
                          }
                      ),
                      SizedBox(width: 30,),

                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            color: Colors.grey,
                            height: 30,
                            width: 1.2,
                          ),
                          CustomText(text: 'OR',color: Colors.grey,fontWeight: FontWeight.w400,),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            color: Colors.grey,
                            height: 30,
                            width: 1.2,
                          ),
                        ],
                      ),
                      SizedBox(width: 30,),

                      ImagePickOption(
                          context,
                          text: 'Camera',
                          icon: Icons.camera_alt,
                          onTap: (){
                            context.read<AccountSetupCubit>().pickImage(ImageSource.camera, context);
                          }
                      ),
                    ],)

                ],
              ),
            )
        );
      },
      child: BlocConsumer<AccountSetupCubit, AccountSetupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [

              Container(
                clipBehavior: Clip.hardEdge,
                width: 16.h,
                height: 16.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.secClr(context),
                ),

                child: (state is AccountSetupIamgeSelected)?
                    Image.file(AccountSetupIamgeSelected.image,fit: BoxFit.cover,width: 17.h,height: 17.h,)
                    :Image.asset(Assets.defaultProfilePic(context)
                ),
              ),

              Container(
                width: 7.w,
                height: 7.w,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppTheme.activeClr(context),
                ),

                child: Icon(
                  Icons.edit,
                  color: AppTheme.invertedClr(context),
                  size: 17.sp,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

