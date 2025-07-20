// lib/features/projects/intl_demo/widgets/language_selector.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my/core/providers/locale_provider.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile<Locale>(
          title: const Text('English'),
          value: const Locale('en'),
          groupValue: locale,
          onChanged: (val) => ref.read(localeProvider.notifier).setLocale(val),
        ),
        RadioListTile<Locale>(
          title: const Text('日本語'),
          value: const Locale('ja'),
          groupValue: locale,
          onChanged: (val) => ref.read(localeProvider.notifier).setLocale(val),
        ),
        RadioListTile<Locale>(
          title: const Text('简体中文'),
          value: const Locale('zh'),
          groupValue: locale,
          onChanged: (val) => ref.read(localeProvider.notifier).setLocale(val),
        ),
        TextButton(
          onPressed: () => ref.read(localeProvider.notifier).setLocale(null),
          child: const Text('🌐 Follow system language'),
        ),
      ],
    );
  }
}
