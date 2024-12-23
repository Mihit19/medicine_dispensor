import 'package:apptofiretorasbpi/utils/constants/colors.dart';
import 'package:apptofiretorasbpi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loader/animation_loader.dart';


class EEFullScreenLoader{

  static void openLoadingDialogue(String text, String animation){
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
          child: Expanded(
            child: Container(
              color: EEHelperFunctions.isDarkMode(Get.context!)?EEColors.dark: EEColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  EEAnimationLoaderWidget(text: text,animation: animation)
                ],
              ),
            ),
          ),
        )
    );
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}