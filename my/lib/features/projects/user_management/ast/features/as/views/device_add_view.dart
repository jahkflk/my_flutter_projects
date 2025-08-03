import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my/core/validators/input_validators.dart';
import '../provider/device_provider.dart';
import '../provider/device_register_form_notifier.dart';

class DeviceAddView extends HookConsumerWidget {
  const DeviceAddView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupListAsync = ref.watch(groupListProvider);
    final form = ref.watch(deviceRegisterFormProvider);
    final notifier = ref.read(deviceRegisterFormProvider.notifier);

    final macController = useTextEditingController();
    final nameController = useTextEditingController();
    final submitClicked = useState(false);

    useEffect(() {
      try {
        macController.addListener(() {
          notifier.updateMac(macController.text);
        });
        nameController.addListener(() {
          notifier.updateName(nameController.text);
        });
      } catch (e, st) {
        debugPrint('❌ useEffect error: $e\n$st');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Initialization error: $e')),
        );
      }
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Device")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: groupListAsync.when(
          data: (groups) => form.when(
            data: (state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Device Name"),
                TextField(controller: nameController),
                const SizedBox(height: 16),
                const Text("MAC Address"),
                TextField(
                  controller: macController,
                  decoration: InputDecoration(
                    errorText:
                        submitClicked.value && !isValidMac(macController.text)
                            ? "Invalid MAC"
                            : null,
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Select Group"),
                DropdownButton<int>(
                  value: state.groupId,
                  hint: const Text("Choose Group"),
                  isExpanded: true,
                  items: groups.map((group) {
                    return DropdownMenuItem<int>(
                      value: group.id,
                      child: Text(group.groupName),
                    );
                  }).toList(),
                  onChanged: (val) => notifier.updateGroupId(val),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      submitClicked.value = true;
                      await notifier.submit(context);
                    } catch (e, st) {
                      debugPrint('❌ Submit error: $e\n$st');
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Submit failed: $e')),
                        );
                      }
                    }
                  },
                  child: state.isSubmitting
                      ? const CircularProgressIndicator()
                      : const Text("Submit"),
                )
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) {
              debugPrint('❌ Device form load error: $e');
              return Text('Device form error: $e');
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) {
            debugPrint('❌ Group list load error: $e');
            return Text('Group list error: $e');
          },
        ),
      ),
    );
  }
}
