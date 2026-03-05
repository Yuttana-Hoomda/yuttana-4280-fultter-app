import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuttana_state_management/providers/counter_provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => CounterProvider(),
    child: const Main(),
  ),
);

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Provider Demo'),
          centerTitle: true,
        ),
        body: Consumer<CounterProvider>(
          builder: (context, count, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Count: ${count.count}',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 40,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => count.increment(),
                    child: const Text(
                      'Increment',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => count.reset(),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
