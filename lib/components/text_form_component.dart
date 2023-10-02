import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';

class TextFormComponent extends StatelessWidget {
  final String name;
  final String? initialValue;
  final VoidCallback? onTap;
  final VoidCallback? onSubmit;
  final bool enabled;
  final bool readOnly;
  final String? hintText, errorText;
  final TextEditingController? ctrl;
  final Widget? suffixIcon, suffixLable;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? errorStyle, hintTextStyle;
  final _borderRadius = const BorderRadius.all(Radius.circular(12));
  final _borderColor = const Color.fromARGB(255, 167, 178, 204);
  final bool textrea;
  final Widget? trailingTitleWidget;
  final BoxConstraints? suffixIconConstraints;
  final bool disableColor;
  final bool? enableInteractiveSelection;

  const TextFormComponent(
      {Key? key,
      required this.name,
      this.onTap,
      this.initialValue,
      this.enabled = true,
      this.readOnly = false,
      this.obscureText = false,
      this.hintText,
      this.hintTextStyle,
      this.suffixIcon,
      this.suffixLable,
      this.prefixIcon,
      this.keyboardType,
      this.ctrl,
      this.validator,
      this.maxLength,
      this.onChanged,
      this.inputFormatters,
      this.onSubmit,
      this.textrea = false,
      this.errorText,
      this.errorStyle,
      this.trailingTitleWidget,
      this.suffixIconConstraints,
      this.disableColor = false,
      this.enableInteractiveSelection = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            trailingTitleWidget ?? const SizedBox(),
          ],
        ),
        SizedBox(height: 8),
        TextFormField(
          minLines: textrea ? 8 : 1,
          maxLines: textrea ? null : 1,
          initialValue: initialValue,
          enabled: enabled,
          controller: ctrl,
          maxLength: maxLength,
          keyboardType: keyboardType,
          onTap: onTap,
          onEditingComplete: onSubmit,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          readOnly: readOnly,
          validator: validator,
          obscureText: obscureText,
          onChanged: onChanged,
          inputFormatters: inputFormatters ?? [RemoveEmojiInputFormatter()],
          enableInteractiveSelection: enableInteractiveSelection,
          decoration: InputDecoration(
            errorStyle: errorStyle,
            errorText: errorText,
            errorMaxLines: 2,
            hintStyle: hintTextStyle ??
                const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
            isDense: true,
            hintText: hintText,
            filled: true,
            fillColor: enabled && disableColor == false
                ? Colors.white
                : const Color.fromARGB(255, 233, 236, 239),
            disabledBorder: OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(
                color: _borderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: _borderRadius,
              borderSide: BorderSide(
                color: _borderColor,
              ),
            ),
            border: OutlineInputBorder(borderRadius: _borderRadius),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            suffixIconConstraints: suffixIconConstraints,
          ),
        )
      ],
    );
  }
}
