import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverprovider/services/provider.dart';

final response = FutureProvider((ref) async {
  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getUser();
});

class UserScreen extends ConsumerWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build again");
    final responseProvider = ref.watch(response);
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: Center(
        child: responseProvider.when(
            data: (data) {
              return Text("${data.firstName}. ${data.lastName}");
            },
            error: (e, error) {
              return Text(e.toString());
            },
            loading: () {
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
