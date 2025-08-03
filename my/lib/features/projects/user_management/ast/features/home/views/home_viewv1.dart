// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../management/viewmodels/user_viewmodel.dart';
//
// class HomeView extends ConsumerStatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   ConsumerState<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends ConsumerState<HomeView> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(
//         () => ref.read(userViewModelProvider.notifier).loadUsers());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final users = ref.watch(userViewModelProvider).users;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               context.go('/login');
//             },
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.push('/user/add'),
//         child: const Icon(Icons.add),
//       ),
//       body: users.isEmpty
//           ? const Center(child: Text('No users found.'))
//           : SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text('ID')),
//                   DataColumn(label: Text('Name')),
//                   DataColumn(label: Text('Email')),
//                   DataColumn(label: Text('Actions')),
//                 ],
//                 rows: users.map((user) {
//                   return DataRow(
//                     cells: [
//                       DataCell(Text(user.id?.toString() ?? '')),
//                       DataCell(Text(user.name)),
//                       DataCell(Text(user.email)),
//                       DataCell(Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.info),
//                             onPressed: () =>
//                                 context.push('/user/detail/${user.id}'),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.edit),
//                             onPressed: () =>
//                                 context.push('/user/edit/${user.id}'),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete),
//                             onPressed: () {
//                               ref
//                                   .read(userViewModelProvider.notifier)
//                                   .deleteUser(user.id!);
//                             },
//                           ),
//                         ],
//                       )),
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ),
//     );
//   }
// }
