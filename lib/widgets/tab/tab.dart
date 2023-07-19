import 'package:flutter/material.dart';

import '../../themes/color_variables.dart';
import '../flex_list/flex_list.dart';

enum CustomTabSwitchType { single, multi }

class CustomTabWidget {
  final String id;
  final Widget widget;
  final Future<bool> Function()? confirmFunction;

  CustomTabWidget(
      {required this.id, required this.widget, this.confirmFunction});
}

class CustomTabSwitch extends StatefulWidget {
  final List<String>? tabs;
  final List<CustomTabWidget>? widgetTabs;
  final String? label;
  final Widget? hintWidget;
  final String? defaultTab;
  final List<String>? defaultTabList;
  final Function onChange;
  final Color backgroundColor;
  final Color activeColor;
  final double tabSize;
  final double? labelPadding;
  final TextStyle? labelTextStyle;
  final TextStyle? tabTextStyle;
  final Color inactiveTextColor;
  final CustomTabSwitchType tabType;
  final double? explicitWidth;
  final EdgeInsetsGeometry? padding;
  final double? explicitMargin;
  final bool overrideMultiToSingle;
  final bool isStyleFill;

  CustomTabSwitch(
      {Key? key,
      this.tabs,
      this.widgetTabs,
      this.label,
      this.hintWidget,
      this.defaultTab,
      this.defaultTabList,
      required this.onChange,
      this.tabSize = 8.0,
      this.labelPadding,
      this.backgroundColor = ReplyColors.white,
      this.activeColor = ReplyColors.blue50,
      this.inactiveTextColor = ReplyColors.blue50,
      this.labelTextStyle,
      this.tabTextStyle,
      this.tabType = CustomTabSwitchType.single,
      this.explicitWidth,
      this.explicitMargin,
      this.padding,
      this.overrideMultiToSingle = false,
      this.isStyleFill = false})
      : super(key: key);

  @override
  State<CustomTabSwitch> createState() => _CustomTabSwitchState();
}

class _CustomTabSwitchState extends State<CustomTabSwitch> {
  String? currentSelect;
  List<String> currentSelectList = [];

  @override
  void initState() {
    super.initState();
    // tooltip = SuperTooltip(
    //   popupDirection: TooltipDirection.down,
    //   borderWidth: 0,
    //   borderColor: ReplyColors.white,
    //   dismissOnTapOutside: true,
    //   arrowTipDistance: 1,
    //   shadowSpreadRadius: 2,
    //   borderRadius: 5,
    //   shadowColor: ReplyColors.neutralBold.withOpacity(0.2),
    //   content: new Material(color: ReplyColors.white, child: widget.hintWidget),
    // );
    currentSelect = widget.defaultTab;
    if (widget.defaultTab != null && widget.defaultTabList == null)
      currentSelectList.add(widget.defaultTab!);
    if (widget.defaultTabList != null)
      currentSelectList = widget.defaultTabList!;
  }

  @override
  void didUpdateWidget(covariant CustomTabSwitch oldWidget) {
    if (widget.defaultTab != oldWidget.defaultTab ||
        widget.defaultTabList != widget.defaultTabList) {
      currentSelect = widget.defaultTab;
      if (widget.defaultTab != null && widget.defaultTabList == null)
        currentSelectList.add(widget.defaultTab!);
      if (widget.defaultTabList != null)
        currentSelectList = widget.defaultTabList!;
    }
    super.didUpdateWidget(oldWidget);
  }

  void changeSelectList(e) {
    if (currentSelectList.contains(e)) {
      currentSelectList.remove(e);
    } else {
      currentSelectList.add(e);
    }
    widget.onChange(currentSelectList);
  }

  @override
  void dispose() {
    // tooltip.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: 8.0),
      child: CustomFlexWrap(
        verticalSpacing: 2,
        horizontalSpacing: 2,
        children: [
          widget.label != null
              ? Container(
                  // height: widget.explicitHeight,
                  padding: EdgeInsets.symmetric(
                      vertical: widget.labelPadding ?? widget.tabSize),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(widget.label!,
                            style: widget.labelTextStyle ??
                                Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  width: 0,
                  height: 0,
                ),
          SizedBox(
            // height: widget.explicitHeight,
            width:
                widget.label != null ? widget.explicitWidth : double.infinity,
            child: Container(
              // height: widget.explicitHeight,
              margin: widget.explicitMargin != null
                  ? EdgeInsets.only(left: widget.explicitMargin!)
                  : null,
              decoration: widget.tabType == CustomTabSwitchType.single
                  ? BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: widget.activeColor, width: 1.5))
                  : null,
              child: IntrinsicWidth(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.tabs != null && widget.tabs!.length > 0
                        ? widget.tabs!.map(
                            (e) {
                              var index = widget.tabs!.indexOf(e);
                              bool isSelected =
                                  widget.tabType == CustomTabSwitchType.multi &&
                                          !widget.overrideMultiToSingle
                                      ? currentSelectList.contains(e)
                                      : currentSelect == e;
                              bool isFirst = index == 0;
                              bool isLast = index == widget.tabs!.length - 1;
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (widget.tabType ==
                                              CustomTabSwitchType.multi &&
                                          !widget.overrideMultiToSingle) {
                                        changeSelectList(e);
                                      } else {
                                        currentSelect = e;
                                        widget.onChange(e);
                                      }
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Flex(
                                        direction: Axis.horizontal,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: widget.tabType ==
                                                      CustomTabSwitchType.multi
                                                  ? EdgeInsets.only(
                                                      left: isFirst ? 0 : 6)
                                                  : null,
                                              padding: EdgeInsets.all(
                                                  widget.tabSize),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                border: widget.tabType ==
                                                        CustomTabSwitchType
                                                            .multi
                                                    ? Border.all(
                                                        color:
                                                            widget.activeColor,
                                                        width: 1.5)
                                                    : null,
                                                color: isSelected
                                                    ? widget.activeColor
                                                    : widget.backgroundColor,
                                                borderRadius: widget.tabType ==
                                                        CustomTabSwitchType
                                                            .multi
                                                    ? BorderRadius.circular(5)
                                                    : BorderRadius.only(
                                                        topLeft: isFirst
                                                            ? Radius.circular(4)
                                                            : Radius.zero,
                                                        bottomLeft: isFirst
                                                            ? Radius.circular(4)
                                                            : Radius.zero,
                                                        bottomRight: isLast
                                                            ? Radius.circular(4)
                                                            : Radius.zero,
                                                        topRight: isLast
                                                            ? Radius.circular(4)
                                                            : Radius.zero),
                                              ),
                                              child: Text(e,
                                                  textAlign: TextAlign.center,
                                                  style: widget.tabTextStyle ??
                                                      Theme.of(context)
                                                          .textTheme
                                                          .labelLarge!
                                                          .copyWith(
                                                              color: isSelected
                                                                  ? widget
                                                                      .backgroundColor
                                                                  : widget
                                                                      .inactiveTextColor)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      (!(widget.tabType ==
                                                  CustomTabSwitchType.multi) &&
                                              !isLast)
                                          ? Align(
                                              child: VerticalDivider(
                                                color: widget.activeColor,
                                                width: 1.3,
                                                thickness: 1.6,
                                              ),
                                              alignment: Alignment.centerRight,
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).toList()
                        : widget.widgetTabs!.map(
                            (e) {
                              var index = widget.widgetTabs!
                                  .indexWhere((ele) => ele.id == e.id);
                              bool isSelected =
                                  widget.tabType == CustomTabSwitchType.multi &&
                                          !widget.overrideMultiToSingle
                                      ? currentSelectList.contains(e.id)
                                      : currentSelect == e.id;
                              bool isFirst = index == 0;
                              bool isLast =
                                  index == widget.widgetTabs!.length - 1;
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    // bool res = await e.confirmFunction!();
                                    bool res = e.confirmFunction != null
                                        ? await e.confirmFunction!()
                                        : true;
                                    print(">>>>>>>>>>>>>>> ${res}");
                                    if (res) {
                                      setState(() {
                                        if (widget.tabType ==
                                                CustomTabSwitchType.multi &&
                                            !widget.overrideMultiToSingle) {
                                          changeSelectList(e.id);
                                        } else {
                                          currentSelect = e.id;
                                          widget.onChange(e.id);
                                        }
                                      });
                                      print('');
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Flex(
                                        direction: Axis.horizontal,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: widget.tabType ==
                                                      CustomTabSwitchType.multi
                                                  ? EdgeInsets.only(
                                                      left: isFirst ? 0 : 6)
                                                  : null,
                                              padding: EdgeInsets.all(
                                                  widget.tabSize),
                                              decoration: BoxDecoration(
                                                border: widget.tabType ==
                                                            CustomTabSwitchType
                                                                .multi &&
                                                        !widget.isStyleFill
                                                    ? Border.all(
                                                        color:
                                                            widget.activeColor,
                                                        width: 1.5)
                                                    : null,
                                                color: isSelected
                                                    ? widget.activeColor
                                                    : widget.backgroundColor,
                                                borderRadius: widget.tabType ==
                                                        CustomTabSwitchType
                                                            .multi
                                                    ? BorderRadius.circular(3)
                                                    : BorderRadius.only(
                                                        topLeft: isFirst
                                                            ? Radius.circular(3)
                                                            : Radius.zero,
                                                        bottomLeft: isFirst
                                                            ? Radius.circular(3)
                                                            : Radius.zero,
                                                        bottomRight: isLast
                                                            ? Radius.circular(3)
                                                            : Radius.zero,
                                                        topRight: isLast
                                                            ? Radius.circular(3)
                                                            : Radius.zero),
                                              ),
                                              child: IconTheme(
                                                data: IconThemeData(
                                                    color: isSelected
                                                        ? widget.backgroundColor
                                                        : widget
                                                            .inactiveTextColor),
                                                child: DefaultTextStyle(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge!
                                                        .copyWith(
                                                            color: isSelected
                                                                ? widget
                                                                        .isStyleFill
                                                                    ? ReplyColors
                                                                        .white
                                                                    : widget
                                                                        .backgroundColor
                                                                : widget
                                                                        .isStyleFill
                                                                    ? ReplyColors
                                                                        .neutral75
                                                                    : widget
                                                                        .inactiveTextColor,
                                                            fontWeight:
                                                                isSelected
                                                                    ? null
                                                                    : FontWeight
                                                                        .w400),
                                                    child: Center(
                                                        child: e.widget)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      (!(widget.tabType ==
                                                  CustomTabSwitchType.multi) &&
                                              !isLast)
                                          ? Align(
                                              child: VerticalDivider(
                                                color: widget.activeColor,
                                                width: 1.3,
                                                thickness: 1.6,
                                              ),
                                              alignment: Alignment.centerRight,
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).toList()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
