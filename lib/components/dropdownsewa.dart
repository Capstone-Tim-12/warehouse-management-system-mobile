import 'package:capstone_wms/classes/colors_collection.dart';
import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/padding_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Dropdownsss extends StatefulWidget {
  const Dropdownsss({super.key, required this.hitunganSwea});

  final Function(String?) hitunganSwea;

  @override
  State<Dropdownsss> createState() => _DropdownsssState();
}

class _DropdownsssState extends State<Dropdownsss> {
  String? selectedItem;
  ColorApp colorApp = ColorApp();
  PaddingCollection paddingApp = PaddingCollection();
  TextCollection textApp = TextCollection();
  DecorationCollection fieldStyle = DecorationCollection();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: colorApp.dark4),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: textApp.bodySmall.copyWith(fontWeight: FontWeight.w400),
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: colorApp.secondaryColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text('Hitungan Sewa',
                    style: textApp.bodySmall
                        .copyWith(fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          value: selectedItem,
          isExpanded: true,
          // icon: const Icon(
          //   Icons.arrow_drop_down,
          // ),
          // underline: ,
          items: <String>['Mingguan', 'Bulanan', 'Tahunan']
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorApp.dark1,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value;
            });
            print(selectedItem);

            widget.hitunganSwea(selectedItem);
          },

          selectedItemBuilder: (BuildContext context) {
            return <String>['Mingguan', 'Bulanan', 'Tahunan']
                .map<Widget>((String item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: colorApp.secondaryColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(item,
                        style: textApp.bodySmall
                            .copyWith(fontWeight: FontWeight.w400)),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
