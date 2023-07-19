import 'package:flutter/material.dart';

class LayoutScaffold extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;

  final PreferredSizeWidget? customAppBar;
  final int? currentChildPageIndex;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Function? refreshScaffold;
  final bool topSafeArea;
  final bool extendBodyBehindAppBar;
  final Widget? drawer;

  LayoutScaffold({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.currentChildPageIndex,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.customAppBar,
    this.drawer,
    this.topSafeArea = true,
    this.refreshScaffold,
    this.extendBodyBehindAppBar = false,
  });

  @override
  State<LayoutScaffold> createState() => _LayoutScaffoldState();
}

class _LayoutScaffoldState extends State<LayoutScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.customAppBar,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      bottomNavigationBar: widget.bottomNavigationBar,
      extendBody: true,
      key: widget.key,
      drawer: widget.drawer,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation ??
          FloatingActionButtonLocation.endFloat,
      backgroundColor:
          widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        top: widget.topSafeArea,
        child: widget.child,
      ),
    );
  }
}
