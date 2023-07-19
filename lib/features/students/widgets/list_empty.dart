import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 200.h),
      child: Text(
        "No records of Students",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
