import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class CustomDropDownSearch extends StatefulWidget {

  final String? title;
  final String? hintText;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelectedName ;
  final TextEditingController dropdownSelectedId;

  const CustomDropDownSearch({super.key, this.title, required this.listdata,
    required this.dropdownSelectedName, required this.dropdownSelectedId, this.hintText});
  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {

  void showDropdownSearch(){
    DropDownState(
      dropDown: DropDown(
        isDismissible: true,
        bottomSheetTitle:  Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonText: 'Save',
        clearButtonText: 'Clear',
        data: widget.listdata,
        onSelected: (selectedItems) {
          SelectedListItem selectedListItem=selectedItems[0];
          widget.dropdownSelectedName.text = selectedListItem.name;
          widget.dropdownSelectedId.text =selectedListItem.value!;
        },
      ),
    ).showModal(context);
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:widget.dropdownSelectedName,
      cursorColor: Colors.black,
      readOnly: true,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropdownSearch();
      },
      decoration:  InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        contentPadding: const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15,),
        hintText:widget.hintText==""? "choose category": widget.hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
