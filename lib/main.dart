import 'package:flutter/material.dart';
import 'package:sample/utilities/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static List<Widget> menuList = [
    for (int i = 1; i <= 5; i++)
      ListTile(
        title: Text("メニュー$i"),
        onTap: () {},
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //scaffoldBackgroundColor: Colors.red,
      ),
      //home: const SamplePage(),
      home: MainPage(menuList: menuList),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(width: 100, height: 100, color: Colors.red),
          const SizedBox(height: 10),
          Expanded(child: Container(color: Colors.green)),
          const SizedBox(height: 10),
          Container(width: 100, height: 100, color: Colors.blue),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.menuList,
  });

  final List<Widget> menuList;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: const Text("Sample"),
                actions: [
                  PopupMenuButton(
                    icon: const Icon(Icons.more_horiz),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context) => menuList
                        .map((e) =>
                            PopupMenuItem(padding: EdgeInsets.zero, child: e))
                        .toList(),
                  ),
                  const SizedBox(width: 10),
                ],
              )
            : null,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!Responsive.isMobile(context)) ...[
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          "Sample",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Divider(height: 0),
                    Expanded(
                      child: ListView.separated(
                        itemCount: menuList.length,
                        itemBuilder: (context, index) => menuList[index],
                        separatorBuilder: (context, index) =>
                            const Divider(height: 0),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(width: 0),
            ],
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: Responsive.isMobile(context)
                        ? WrapAlignment.center
                        : WrapAlignment.start,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (int i = 0; i < 20; i++)
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
