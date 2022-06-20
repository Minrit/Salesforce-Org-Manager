import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    Key? key,
    Widget? title,
    BuildContext? context,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    bool initialValue = false,
    ValueChanged<bool>? onChanged,
    AutovalidateMode? autovalidateMode,
    bool enabled = true,
    bool dense = false,
    Color? errorColor,
    Color? activeColor,
    Color? checkColor,
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.leading,
    EdgeInsetsGeometry? contentPadding,
    bool autofocus = false,
    Widget? secondary,
  }) : super(
    key: key,
    onSaved: onSaved,
    validator: validator,
    initialValue: initialValue,
    autovalidateMode: autovalidateMode,
    builder: (FormFieldState<bool> state) {
      errorColor ??=
      (context == null ? Colors.red : Theme.of(context).errorColor);

      return CheckboxListTile(
        title: title,
        dense: dense,
        activeColor: activeColor,
        checkColor: checkColor,
        value: state.value,
        onChanged: enabled
            ? (value) {
          state.didChange(value);
          if (onChanged != null) onChanged(value!);
        }
            : null,
        subtitle: state.hasError
            ? Text(
          state.errorText!,
          style: TextStyle(color: errorColor),
        )
            : null,
        controlAffinity: controlAffinity,
        secondary: secondary,
        contentPadding: contentPadding,
        autofocus: autofocus,
      );
    },
  );
}