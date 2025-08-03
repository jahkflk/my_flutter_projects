import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class AsView extends HookConsumerWidget {
  const AsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ 初始化逻辑带 try-catch
    useEffect(() {
      Future.microtask(() async {
        try {
          // 模拟初始化逻辑（例如加载数据）
          await Future.delayed(const Duration(milliseconds: 200));
          debugPrint('✅ 初始化成功');
        } catch (e, st) {
          debugPrint('❌ 初始化失败: $e\n$st');
          // 可选：显示 SnackBar 或提示框
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Initialization failed: $e')),
            );
          }
        }
      });
      return null; // useEffect 的返回值用于清理资源，这里不需要
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('AsView')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.push('/group_add');
              },
              child: const Text('Go to /group_add'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/device_add');
              },
              child: const Text('Go to /device_add'),
            ),
          ],
        ),
      ),
    );
  }
}
