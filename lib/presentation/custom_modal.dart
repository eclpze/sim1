import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sumilyaqu/presentation/styles.dart';

class CustomModal {
  static void show({required BuildContext context, required String title}) {
    showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(),
      context: context,
      builder: (context) => Container(
        child: Column(
          children: [
            Text(title, style: title2Semibold,)
          ],
        ),
      ),
    );
  }
}
