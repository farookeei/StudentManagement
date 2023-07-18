import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/color_variables.dart';

Future<void> customAlertDialog<T>({
  required BuildContext context,
  required List<Widget> actions,
  required Widget body,
  final String? iconAsset,
  final IconData? icon,
  final bool outsideDismissible = true,
  final bool barrierDismissible = true,
  final Color iconColor = ReplyColors.blue75, //!theme
  final Function? popFunction,
}) async {
  final result = await showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          if (popFunction != null) {
            popFunction();
          }
          return outsideDismissible;
        },
        child: SimpleDialog(
          contentPadding: EdgeInsets.all(12.r),
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          backgroundColor: ReplyColors.neutralLight,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 60, maxHeight: 60),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: icon != null
                        ? Icon(icon, color: iconColor, size: 30.h)
                        : iconAsset != null
                            ? SvgPicture.asset(
                                iconAsset,
                                height: 30.h,
                                color: iconColor,
                              )
                            : Icon(Icons.info_outline_rounded,
                                color: iconColor, size: 30.h),
                  ),
                ),
                IconButton(
                  iconSize: 20.w,
                  icon: const Icon(
                    Icons.close,
                    color: ReplyColors.neutral75,
                  ),
                  onPressed: () {
                    if (popFunction != null) {
                      popFunction();
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            body,
            actions.isNotEmpty
                ? const SizedBox(
                    height: 20,
                  )
                : const SizedBox(),
            ...actions,
          ],
        ),
      );
    },
  );

  return result;
}
