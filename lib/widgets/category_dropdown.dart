import 'package:flutter/material.dart';
import 'package:smart_spend/utils/icons_list.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown({super.key, this.cattype, required this.onChanged});

  final String? cattype;
  final ValueChanged<String?> onChanged;
  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: cattype,
        isExpanded: true,
        hint: const Text("Selected Category"),
        items: appIcons.homeExpenseCategories.map((e) =>
            DropdownMenuItem<String>(
                value: e['name'],
                child: Row(
                  children: [
                    Icon(
                      e['icon'],
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 10,),
                    Text(e['name'],
                    style: const TextStyle(color: Colors.black45),),
                  ],
                ))).toList(),
        
        onChanged: onChanged);
  }
}
