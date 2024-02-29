import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template app_text_field}
/// A text field component based on material [TextFormField] widget with a
/// fixed, left-aligned label text displayed above the text field.
/// {@endtemplate}
class AppTextField extends StatelessWidget {
  /// {@macro app_text_field}
  const AppTextField({
    super.key,
    this.initialValue,
    this.autoFillHints,
    this.controller,
    this.inputFormatters,
    this.autocorrect = true,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.label,
    this.margin,
  });

  /// A value to initialize the field to.
  final String? initialValue;

  /// List of auto fill hints.
  final Iterable<String>? autoFillHints;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to enable autocorrect.
  /// Defaults to true.
  final bool autocorrect;

  /// Whether the text field should be read-only.
  /// Defaults to false.
  final bool readOnly;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that appears below the field.
  final String? errorText;

  /// A widget that appears before the editable part of the text field.
  final Widget? prefix;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  /// The type of keyboard to use for editing the text.
  /// Defaults to [TextInputType.text] if maxLines is one and
  /// [TextInputType.multiline] otherwise.
  final TextInputType? keyboardType;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  final ValueChanged<String>? onSubmitted;

  /// Called when the text field has been tapped.
  final VoidCallback? onTap;

  /// Obscure text when type a password.
  final bool obscureText;

  /// The label to display above the text field.
  final String? label;

  /// The margin around the text field.
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) Text(label!),
          const SizedBox(height: AppSpacing.sm),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48),
            child: TextFormField(
              key: key,
              initialValue: initialValue,
              controller: controller,
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              obscureText: obscureText,
              autocorrect: autocorrect,
              readOnly: readOnly,
              autofillHints: autoFillHints,
              cursorColor: Theme.of(context).colorScheme.primary,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
              onFieldSubmitted: onSubmitted,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(AppSpacing.md),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey
                        : Colors.grey[300]!,
                    width: .5,
                  ),
                ),
                hintText: hintText,
                errorText: errorText,
                prefixIcon: prefix,
                suffixIcon: suffix,
                suffixIconConstraints: const BoxConstraints.tightFor(
                  width: 32,
                  height: 32,
                ),
                prefixIconConstraints: const BoxConstraints.tightFor(
                  width: 48,
                ),
              ),
              onChanged: onChanged,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
