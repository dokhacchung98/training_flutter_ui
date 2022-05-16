import 'package:flutter/material.dart';
import 'package:training_flutter_ui/generated/l10n.dart';
import 'package:training_flutter_ui/style/style_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(S.of(context).bottom_tab_account,
                style: StyleText.styleTextTitleHome),
          ),
          Expanded(
            child: Center(
              child: Text(
                S.of(context).upgrading,
                style: StyleText.styleTextCategory,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
