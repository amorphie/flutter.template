import 'package:burgankuwait/core/dependency_injection/dependency_injection.dart';
import 'package:burgankuwait/core/reusable_widgets/custom_widget_registerer.dart';
import 'package:burgankuwait/widgetbook/pages/widgetbook_folder_dynamic_pages.dart';
import 'package:burgankuwait/widgetbook/pages/widgetbook_folder_login_signup_pages.dart';
import 'package:burgankuwait/widgetbook/reusable_widgets/widgetbook_brg_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() async {
  await configureDependencies();
  CustomWidgetRegisterer().init();
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookFolder(
          name: 'Widgets',
          children: [
            WidgetbookFolder(
              name: 'Reusable Widgets',
              children: [
                widgetbookBrgTextFormField,
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Pages',
          children: [
            widgetbookFolderLoginSignupPages,
            widgetbookFolderDynamicPages,
          ],
        ),
      ],
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeData.light()),
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          ],
        ),
        DeviceFrameAddon(
          devices: [...Devices.ios.all, ...Devices.android.all],
        ),
      ],
    );
  }
}
