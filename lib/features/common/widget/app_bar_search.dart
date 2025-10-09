import 'package:flutter/material.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/config/theme/theme.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/widget/app_back_button.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/function.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String hintText;
  final bool withLeading;
  final Function(String)? onChanged;
  final List<Widget>? actions;
  const AppBarSearch({
    super.key,
    this.actions,
    required this.title,
    this.withLeading = true,
    this.onChanged,
    required this.hintText,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarSearch> createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  final controller = TextEditingController();
  final searchMode = false.obs;

  void close() {
    if (widget.onChanged != null) {
      widget.onChanged!('');
      controller.clear();
    }
  }

  void onSearch() {
    searchMode.value = !searchMode.value;
    if (!searchMode.value) close();
  }

  void onLeadingTap() {
    if (searchMode.value) {
      searchMode.value = false;
      close();
    } else {
      Get.back();
    }
  }

  Future<void> onWillPop() async {
    if (searchMode.value) {
      searchMode.value = false;
      close();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: !searchMode.value,
        onPopInvokedWithResult: (_, _) => onWillPop(),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppTheme.borderColor)),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: widget.withLeading
                ? AppBackButton(onPressed: onLeadingTap, color: Colors.black)
                : null,
            title: searchMode.value ? formSearch() : Text(widget.title),
            titleTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                onPressed: onSearch,
                icon: Icon(
                  searchMode.value ? MdiIcons.close : MdiIcons.magnify,
                ),
              ),
              ...widget.actions ?? [],
            ],
          ),
        ),
      ),
    );
  }

  Widget formSearch() {
    return TextFormField(
      autofocus: true,
      controller: controller,
      onChanged: (v) {
        if (widget.onChanged != null) {
          Func.searchListener(v, (result) async => {widget.onChanged!(result)});
        }
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: const TextStyle(fontSize: 14),
        hintText: widget.hintText,
      ),
    );
  }
}
