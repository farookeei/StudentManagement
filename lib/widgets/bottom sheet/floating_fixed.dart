import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FloatingModal extends StatelessWidget {
  // action sheet for android and web wrapper wrappes the existing sheet to make it floating
  final Widget child;

  const FloatingModal({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final _sheetWidth = _screenWidth > 1000
        ? _screenWidth * 0.35
        : _screenWidth > 600 && _screenWidth < 1000
            ? _screenWidth * 0.25
            : _screenWidth * 0.0;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _sheetWidth),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            child: child,
          ),
        ),
      ),
    );
  }
}

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) async {
  // show floating modal bottom sheet
  final result = await showCustomModalBottomSheet(
    context: context,
    builder: builder,
    containerWidget: (_, animation, child) => FloatingModal(
      child: child,
    ),
    expand: false,
  );

  return result;
}
