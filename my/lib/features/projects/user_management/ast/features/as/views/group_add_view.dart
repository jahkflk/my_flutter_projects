import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';

import '../provider/group_register_form_notifier.dart';

class GroupAppView extends HookConsumerWidget {
  const GroupAppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(groupRegisterFormProvider);
    final notifier = ref.read(groupRegisterFormProvider.notifier);

    final groupNameController = useTextEditingController();

    // 只在初始化时设置一次文本框内容，避免输入时光标跳动
    useEffect(() {
      groupNameController.text = formState.maybeWhen(
        data: (state) => state.groupName,
        orElse: () => '',
      );
      return null;
    }, []);

    final submitClicked = useState(false);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: formState.when(
          data: (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Group Name (Login ID)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                enabled: !state.isSubmitting,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: state.isSubmitting
                    ? null
                    : () async {
                        submitClicked.value = true;
                        await notifier.submit(context);
                        // 提交成功后清空输入框和错误状态
                        if (context.mounted && !state.isSubmitting) {
                          groupNameController.clear();
                          submitClicked.value = false;
                        }
                      },
                child: state.isSubmitting
                    ? const CircularProgressIndicator()
                    : const Text('Submit'),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }
}
