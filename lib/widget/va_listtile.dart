import 'package:capstone_wms/classes/inputstyle_collection.dart';
import 'package:capstone_wms/classes/text_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VirtualAccountSelectionWidget extends StatefulWidget {
  VirtualAccountSelectionWidget({
    required this.bankName,
    required this.logoAsset,
    required this.isSelected,
    required this.onSelect,
  });
  final String bankName;
  final String logoAsset;
  final bool isSelected;
  final Function(bool) onSelect;

  @override
  State<VirtualAccountSelectionWidget> createState() =>
      _VirtualAccountSelectionWidgetState();
}

class _VirtualAccountSelectionWidgetState
    extends State<VirtualAccountSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SizedBox(
        width: 40,
        height: 40,
        // child: SvgPicture.asset(widget.logoAsset, fit: BoxFit.cover),
        child: Image.network(widget.logoAsset, fit: BoxFit.contain),
      ),
      title: Text(
        widget.bankName,
        style: TextCollection().bodySmall.copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: widget.isSelected
          ? CircleAvatar(
              radius: 12.5,
              backgroundColor: colorApp.stateSuccess,
              child: const Icon(Icons.check, color: Colors.white))
          : const SizedBox(width: 24, height: 24),
      onTap: () {
        widget.onSelect(!widget.isSelected);
      },
    );
  }
}
