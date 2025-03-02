import 'package:crud_riverpod/configs/configs.dart';
import 'package:crud_riverpod/screens/screens.dart';
import 'package:crud_riverpod/services/services.dart';
import 'package:crud_riverpod/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text('Riverpod CRUD', style: TextStyle(color: Palette.text)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => EditUserScreen()));
            },
            icon: const Icon(Icons.add, color: Palette.icon),
          ),
          SizedBox(width: 10),
        ],
      ),
      body:
          // On loading
          (data.isLoading)
              ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShimmerList(),
                  ShimmerList(),
                  ShimmerList(),
                  ShimmerList(),
                  ShimmerList(),
                ],
              )
              // On data
              : (data.users.isNotEmpty)
              ? SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...data.users.map(
                      (e) => CustomList(
                        title: e.name,
                        subtitle: '${e.age} • ${e.email}',
                        actions: [
                          CustomActionButton(
                            svgPath: 'assets/svgs/edit.svg',
                            onTap: () {
                              debugPrint(e.id);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditUserScreen(user: e),
                                ),
                              );
                            },
                          ),
                          CustomActionButton(
                            svgPath: 'assets/svgs/delete.svg',
                            color: Colors.redAccent,
                            size: 27,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder:
                                    (BuildContext context) =>
                                        CustomBottomSheet(user: e),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              // On error
              : Center(child: Text(data.error.toString())),
    );
  }
}
