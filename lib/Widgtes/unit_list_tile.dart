import 'package:flutter/material.dart';

class UnitListTile extends StatelessWidget {
  UnitListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);
  final title;
  final value;
  final onChanged;
  final groupValue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: Text(
        title,
        style: Theme.of(context).textTheme.headline1?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
      ),
      trailing: Radio(
        activeColor: Colors.black,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        toggleable: true,
      ),
    );
  }
}
