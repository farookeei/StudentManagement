import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'floating_fixed.dart';

enum FixedSheetType {
  fixed,
  floating,
  floatingAndroidFixedIos,
}

void fixedBottomSheet(
    {required BuildContext context,
    required Widget child,
    FixedSheetType type = FixedSheetType.fixed,
    bool? isDismissible}) {
  if (type == FixedSheetType.fixed) {
    handleFixedBottomSheet(
      context,
      isDismissible: isDismissible,
      child: child,
    );
  } else if (type == FixedSheetType.floating) {
    showFloatingModalBottomSheet(
      context: context,
      builder: (context) => child,
    );
  }
}

void handleFixedBottomSheet(context, {required child, bool? isDismissible}) {
  if (Platform.isIOS) {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      builder: (context) => child,
      isDismissible: true,
      closeProgressThreshold: 0.4,
      enableDrag: isDismissible ?? true,
    );
  } else {
    showMaterialModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      expand: false,
      context: context,
      builder: (context) => child,
      isDismissible: true,
      closeProgressThreshold: 0.4,
      enableDrag: isDismissible ?? true,
    );
  }
}

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
}) async {
  // show floating modal bottom sheet
  final result = await showCustomModalBottomSheet(
    context: context,
    builder: builder,
    containerWidget: (_, animation, child) => FloatingModal(
      child: child,
    ),
    expand: false,
    isDismissible: true,
  );

  return result;
}

/// Shows a modal material design bottom sheet.
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  required WidgetWithChildBuilder containerWidget,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  Color? barrierColor,
  bool bounce = false,
  bool expand = false,
  AnimationController? secondAnimation,
  Curve? animationCurve,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Duration? duration,
  RouteSettings? settings,
  double? closeProgressThreshold,
}) async {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  final hasMaterialLocalizations =
      Localizations.of<MaterialLocalizations>(context, MaterialLocalizations) !=
          null;
  final barrierLabel = hasMaterialLocalizations
      ? MaterialLocalizations.of(context).modalBarrierDismissLabel
      : '';

  final result = await Navigator.of(context, rootNavigator: useRootNavigator)
      .push(ModalSheetRoute<T>(
    builder: builder,
    bounce: bounce,
    containerBuilder: containerWidget,
    secondAnimationController: secondAnimation,
    expanded: expand,
    barrierLabel: barrierLabel,
    isDismissible: isDismissible,
    modalBarrierColor: barrierColor,
    enableDrag: enableDrag,
    animationCurve: animationCurve,
    duration: duration,
    settings: settings,
    closeProgressThreshold: closeProgressThreshold,
  ));
  return result;
}
