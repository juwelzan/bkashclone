import 'package:flutter/material.dart';
import 'package:flutter_assets_pkg/flutter_assets_pkg.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "HomeScreen";
  static const String path = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: Listenable.merge([top, loding]),
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                top: loding.value,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: Colors.blue,
                    ),
                    child: FlutterAssetsImage(imagePath: BkashAssets.addMoney),
                  ),
                ),
              ),
              Positioned(
                top: top.value,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(color: Colors.amber),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      _onNotification(notification);
                      return false;
                    },

                    child: ListView.builder(
                      padding: EdgeInsets.all(0),

                      itemCount: 50,
                      itemBuilder: (context, index) =>
                          ListTile(title: Text("Item $index")),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  ValueNotifier<double> top = ValueNotifier<double>(100);
  ValueNotifier<double> loding = ValueNotifier<double>(200);
  ValueNotifier<double> overscrollValue = ValueNotifier<double>(0);

  void _onNotification(ScrollNotification notification) {
    if (notification is OverscrollNotification) {
      if (notification.metrics.extentBefore == 0) {
        overscroll(-notification.overscroll);
      }
    }
    if (notification is ScrollUpdateNotification) {}
  }

  void overscroll(double over) {
    loggerLog(over);
  }

  void scrollDown() {}
  void scrollUp() {}
}

void loggerLog(dynamic any) {
  debugPrint(any.toString());
}
