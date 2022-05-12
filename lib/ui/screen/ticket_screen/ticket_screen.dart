import 'package:flutter/material.dart';
import 'package:training_flutter_ui/style/style_text.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text('Ticket', style: StyleText.styleTextTitleHome),
          ),
        ],
      ),
    );
  }
}
