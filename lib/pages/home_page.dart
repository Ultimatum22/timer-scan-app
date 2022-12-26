import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:timer_scan_app/pages/timer_task/timer_task_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;
  String _platformVersion = 'Unknown';

  int? _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  Size? _previewOcr;

  final List<BottomNavigationItem> _bottomNavigationItems =
      <BottomNavigationItem>[
    const BottomNavigationItem(
        Icon(Icons.home), 'Running timers', TimerTaskListPage()),
    const BottomNavigationItem(
        Icon(Icons.history), 'History timers', TimerTaskListPage()),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;

    initPlatformState();
    FlutterMobileVision.start().then((previewSizes) => setState(() {
          _previewOcr = previewSizes[_cameraOcr]!.first;
        }));
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await FlutterMobileVision.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() => _platformVersion = platformVersion);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: const Color(0xFF101725),
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            onTap: (final int index) => setState(() => _selectedIndex = index),
            items: _bottomNavigationItems
                .map((final BottomNavigationItem item) =>
                    BottomNavigationBarItem(icon: item.icon, label: item.label))
                .toList()),
        body: _bottomNavigationItems[_selectedIndex].page,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: _scanOCR,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  Future<void> _scanOCR() async {
    final List<OcrText> texts = <OcrText>[];
    Size _scanpreviewOcr = _previewOcr ?? FlutterMobileVision.PREVIEW;

    try {
      texts.addAll(await FlutterMobileVision.read(
        preview: _previewOcr ?? FlutterMobileVision.PREVIEW,
        scanArea: Size(_scanpreviewOcr.width - 20, _scanpreviewOcr.height - 20),
        showText: true,
        fps: 2.0,
      ));
    } on Exception {
      texts.add(OcrText('Failed to recognize text.'));
    }

    if (!mounted) {
      return;
    }

    print(texts);
  }
}

@immutable
class BottomNavigationItem {
  final Icon icon;
  final String label;
  final Widget page;

  const BottomNavigationItem(this.icon, this.label, this.page);
}
