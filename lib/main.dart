import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:widgets_and_more/res/assets_app.dart';
import 'package:widgets_and_more/res/color_app.dart';
import 'package:widgets_and_more/res/string_app.dart';
import 'package:widgets_and_more/res/theme/theme_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale(
          'en',
        ),
        Locale(
          'ar',
        )
      ],
      path: 'assets/translate', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

bool isLight = true;

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> types = ["MEAT", "VEGETABEL", "SWEET"];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        darkTheme: themeDark,
        themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SomeWidgets());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (context.locale.languageCode == "ar") {
                  context.setLocale(
                    Locale(
                      "en",
                    ),
                  );
                } else {
                  context.setLocale(
                    Locale(
                      'ar',
                    ),
                  );
                }
              },
              icon: Icon(Icons.translate))
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            AssetsApp.DELEVRYMAN,
            color: Colors.green,
          ),
          Text(StringApp().FIRSTTITLE),
          Text(StringApp().FIRSTSUBTITLE),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorApp.primary,
                ),
                width: 30,
                height: 30,
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(
          StringApp().NEXT,
        ),
      ),
    );
  }
}

class SomeWidgets extends StatefulWidget {
  const SomeWidgets({super.key});

  @override
  State<SomeWidgets> createState() => _SomeWidgetsState();
}

class _SomeWidgetsState extends State<SomeWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownMenu(
              label: Text('select'),
              onSelected: (value) {
                types[0] = value!;
                print(value);
              },
              dropdownMenuEntries: [
                DropdownMenuEntry<String>(
                  value: types[0],
                  label: 'Meat',
                ),
                DropdownMenuEntry<String>(
                  value: types[1],
                  label: 'Vega',
                ),
                DropdownMenuEntry<String>(
                  value: types[2],
                  label: 'Sweet',
                ),
              ],
            ),
            PopupMenuButton(
              itemBuilder: (context) => List.generate(
                4,
                (index) => PopupMenuItem(
                  onTap: () {
                    setState(() {
                      isLight = !isLight;
                    });
                    print(isLight);
                  },
                  child: Text(
                    index.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(
          label: 'Hello',
          icon: Icon(Icons.help_outline),
        ),
        NavigationDestination(
          label: 'World',
          icon: Icon(Icons.wordpress_outlined),
        )
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // showAboutDialog(
        //   context: context,
        //   applicationName: "FaceBook",
        //   applicationIcon: Icon(
        //     Icons.facebook,
        //   ),
        // );
        showDialog(
          // useRootNavigator: !Navigator.canPop(context),
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Sure",
                ),
              ),
            ],
            content: Text(
              "Hello World",
            ),
            title: Text(
              "Text From",
            ),
          ),
        );
      }),
    );
  }
}
