import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';

import '../provider/group_register_form_notifier.dart';

class GroupAppView extends HookConsumerWidget {
  const GroupAppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(groupRegisterFormProvider);
    final notifier = ref.read(groupRegisterFormProvider.notifier);

    final groupNameController = useTextEditingController();

    final submitClicked = useState(false);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: form.when(
          data: (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('groupName (Login ID)',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(
                controller: groupNameController,
                decoration: InputDecoration(
                  hintText: 'example@example.com',
                  errorText: submitClicked.value &&
                          !isValidEmail(groupNameController.text)
                      ? 'Invalid email format'
                      : null,
                ),
                onChanged: notifier.updateGroupName,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  submitClicked.value = true;
                  await notifier.submit(context); // 👈 添加 context 参数
                },
                child: state.isSubmitting
                    ? const CircularProgressIndicator()
                    : const Text('Submit'),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
        ),
      ),
    );
  }
}
