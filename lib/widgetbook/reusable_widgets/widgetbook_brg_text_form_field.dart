import 'package:burgankuwait/core/reusable_widgets/brg_text_form_field/brg_text_form_field.dart';
import 'package:burgankuwait/core/util/brg_validator.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookBrgTextFormField => WidgetbookComponent(
      name: 'BrgTextFormField',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => BrgTextFormField(
            labelText: context.knobs.string(
              label: 'Label text',
              initialValue: 'Label text',
            ),
            controller: TextEditingController(),
            prefixIcon: context.knobs.list(
              label: 'Prefix Icon',
              options: [
                const SizedBox.shrink(),
                const Icon(Icons.numbers),
                const Icon(Icons.add),
                const Icon(Icons.crop_square_sharp),
                const Icon(Icons.circle),
              ],
            ),
          ).paddingAll(16),
        ),
        WidgetbookUseCase(
          name: 'T.C.K.N.',
          builder: (context) => BrgTextFormField.tckn(
            context: context,
            controller: TextEditingController(),
          ).paddingAll(16),
        ),
        WidgetbookUseCase(
          name: 'Phone Number',
          builder: (context) => BrgTextFormField.phoneNumber(
            context: context,
            controller: TextEditingController(),
          ).paddingAll(16),
        ),
        WidgetbookUseCase(
          name: 'Password',
          builder: (context) {
            final passwordLength = context.knobs.double
                .input(
                  label: 'Password Length',
                  initialValue: 6,
                )
                .toInt();
            return BrgTextFormField.password(
              labelText: context.knobs.string(
                label: 'Label text',
                initialValue: 'Password',
              ),
              context: context,
              controller: TextEditingController(),
              validator: BrgValidator().minLength(
                minLength: passwordLength,
                errorMessage: "Password should be $passwordLength characters.",
              ),
              maxLength: passwordLength,
              onlyDigits: context.knobs.boolean(label: 'Only digits'),
              obscureText: context.knobs.boolean(label: 'Obscure text', initialValue: true),
            ).paddingAll(16);
          },
        ),
      ],
    );
