import 'package:flutter/material.dart';
import 'package:learn_provider_flutter/Models/infos.dart';
import 'package:learn_provider_flutter/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Infos(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Page1(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(child: Top()),
          Flexible(child: Bottom()),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var infos = Provider.of<Infos>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(infos.title),
            Text(infos.description),
          ],
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var infos = Provider.of<Infos>(context);
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              child: Text(
                "Change value",
              ),
              onPressed: () {
                print("change value now");
                infos.setTitle("new title");
                infos.setDescription('new description');
              },
            ),
            RaisedButton(
              child: Text("next page"),
              onPressed: () {
                print("go to next page");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Page2(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var infos = Provider.of<Infos>(context);
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(infos.title),
            Text(infos.description),
          ],
        ),
      ),
    );
  }
}
