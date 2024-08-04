import 'package:flutter/material.dart';

import '../assets/constants.dart';

import '../excel/create_Monthly_PL.dart';

class CreateButton extends StatefulWidget {
  const CreateButton({super.key});

  @override
  State<CreateButton> createState() => _CreateButtonState();
}

class _CreateButtonState extends State<CreateButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorSet.unSelectedBackgroundColor,
      ),
      onPressed: () async {
        await createMonthlyPL();
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Icon(
            Icons.file_download,
            size: 20,
            color: ColorSet.yourtoryNavy,
          ),
          // SizedBox(),
          Text(
            'ダウンロード',
            style: TextStyle(
              color: ColorSet.yourtoryNavy,
            ),
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
