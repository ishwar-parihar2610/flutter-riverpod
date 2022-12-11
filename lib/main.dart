import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverprovider/screens/example_1.dart';
import 'package:riverprovider/screens/example_2.dart';
import 'package:riverprovider/screens/user.dart';

/// auto dispose state
// final counterProvider = StateProvider.autoDispose((ref) => 0);
final counterProvider = StateProvider.autoDispose((ref) => 0);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
              surface: Color(0xff003909))),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home:UserScreen()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CounterPage()));
        },
        child: Text('Go To Counter Page'),
      ),
    );
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("rebuild widget");
    final int counter = ref.watch(counterProvider);
    // final int counter=ref.watch(counterProvider);

    ref.listen<int>(counterProvider, (previous, next) {
      if (next >= 5) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Warning'),
                content: Text('Counter Dangerous High. Consider Resetting it'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Ok"))
                ],
              );
            });
       }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Conuter'),
        actions: [
          IconButton(
              onPressed: () {
                // ref.invalidate(counterProvider);
                ref.invalidate(counterProvider);
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(
          '${counter.toString()}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
