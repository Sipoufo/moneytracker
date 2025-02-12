import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

/// Input field form
/// [label] represent the label of input field.
/// [placeholder] represent the placeholder of input field.
/// [textInputType] use for determine the type of input field.
/// [controller] represent the controller of input field.
/// [onTap] represent the onTap function of input field. It's not obligated.
/// [isPassword] use for determine if field is a password field or not. The default value is false.
/// [maxLine] use for determine the maximum line of field. It's use if we want a textarea. The default value is 1.
/// [readOnly] use for determine if the field is read only. The default value is false
class InputFormWidget extends StatefulWidget {
  final String? label;
  final String placeholder;
  final TextInputType textInputType;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool isPassword;
  final int maxLine;
  final bool readOnly;
  final String? Function(String?)? validator;

  const InputFormWidget({
    super.key,
    this.label,
    required this.placeholder,
    required this.textInputType,
    required this.controller,
    this.onTap,
    this.isPassword = false,
    this.maxLine = 1,
    this.readOnly = false,
    this.validator,
  });

  @override
  State<InputFormWidget> createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  bool _seePassword = false;
  FocusNode focusNode = FocusNode();
  String? errorValue;

  @override
  void initState() {
    super.initState();
    _seePassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SizeUtil.spaceBtwItems_8,
        children: [
          if (widget.label != null)
            Text(
              widget.label!,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          TextFormField(
            onTap: widget.onTap,
            maxLines: widget.maxLine,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            obscureText: widget.isPassword && !_seePassword,
            readOnly: widget.readOnly,
            style: Theme.of(context).textTheme.titleSmall,
            cursorColor: Theme.of(context).colorScheme.surface,
            focusNode: focusNode,
            onTapAlwaysCalled: true,
            validator: widget.validator,
            onTapOutside: (PointerDownEvent pointer) {
              focusNode.unfocus();
            },
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
              fillColor: Theme.of(context).colorScheme.primaryContainer,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: SizeUtil.sm_12, vertical: SizeUtil.md_20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                borderSide: const BorderSide(
                  color: ColorsUtils.primary_5,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(0),
                child: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _seePassword = !_seePassword;
                          });
                        },
                        icon: _seePassword ? IconsUtils.eyeOpen : IconsUtils.eyeClose,
                      )
                    : null,
              ),
            ),
          ),
          if(errorValue != null)
            Text(
              errorValue!,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: ColorsUtils.danger_5,
              ),
            ),
        ],
      ),
    );
  }
}
