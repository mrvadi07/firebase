import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DemoStorage extends StatefulWidget {
  const DemoStorage({Key? key}) : super(key: key);

  @override
  State<DemoStorage> createState() => _DemoStorageState();
}

class _DemoStorageState extends State<DemoStorage> {
  final box = GetStorage();
  bool isa = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                await box.write('username', 'abc');
                await box.write('userid', '123456');
              },
              child: Text('add'),
            ),
            ElevatedButton(
              onPressed: () async {
                print('${box.read('username')}');
                print('${box.read('userid')}');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Text("Hello"),
                    ));
              },
              child: Text('get'),
            ),
            ElevatedButton(
              onPressed: () async {
                await box.remove('username');
                await box.remove('userid');
              },
              child: Text('remove'),
            ),
            ElevatedButton(
              onPressed: () async {
                await box.erase();
              },
              child: Text('remove All'),
            ),
          ],
        ),
      ),
    );
  }
}
