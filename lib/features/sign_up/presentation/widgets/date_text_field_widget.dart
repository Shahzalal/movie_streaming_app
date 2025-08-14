import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/size_config.dart';


class DateTextFieldWidget extends StatefulWidget {
  const DateTextFieldWidget({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  State<DateTextFieldWidget> createState() => _DateTextFieldWidgetState();
}

class _DateTextFieldWidgetState extends State<DateTextFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _controller.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return TextField(
      controller: _controller,
      readOnly: true,
      onTap: _pickDate,
      style: TextStyle(
        color: AppColors.mainTextColor,
        fontSize: SizeConfig.ws(16),
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.calendar_today,
          color: AppColors.mainTextColor,
          size: SizeConfig.ws(24),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.versionTextColor,
          fontSize: SizeConfig.ws(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.versionTextColor,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.ws(6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryBlue,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.ws(6)),
        ),
      ),
    );
  }
}
