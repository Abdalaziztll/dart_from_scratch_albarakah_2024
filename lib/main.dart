import 'package:cash_storing_with_service_layer/config/service_locater.dart';
import 'package:cash_storing_with_service_layer/provider/user_provider.dart';
import 'package:cash_storing_with_service_layer/view/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: TempPage(),
      ),
    );
  }
}

class TempPage extends StatelessWidget {
  const TempPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(),
            ),
          );
        },
      ),
    );
  }
}
