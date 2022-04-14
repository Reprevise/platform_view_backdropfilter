import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:platform_view_backdropfilter/platform_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter ImageFilter Blur w/ Ads Broken'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const DialogWithAdsView(),
                      ),
                    );
                  },
                  child: const Text("Dialog w/ Platform View"),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const BareDialogView(),
                      ),
                    );
                  },
                  child: const Text("Dialog w/o Platform View"),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class BareDialogView extends StatelessWidget {
  const BareDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog w/o Platform View"),
      ),
      body: const Center(child: GoToDialog()),
    );
  }
}

class DialogWithAdsView extends StatelessWidget {
  const DialogWithAdsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog w/o Platform View"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          GoToDialog(),
          MyPlatformViewWidget(),
        ],
      ),
    );
  }
}

class GoToDialog extends StatelessWidget {
  const GoToDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const BlurredDialog(),
        );
      },
      child: const Text("open blurred dialog"),
    );
  }
}

class BlurredDialog extends StatelessWidget {
  const BlurredDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "this is a blurred dialog",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
              ),
              child: const Text("go back"),
            ),
          ],
        ),
      ),
    );
  }
}
