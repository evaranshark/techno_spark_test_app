import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_spark_test_app/content_model.dart';
import 'package:techno_spark_test_app/helpers.dart';
import 'package:techno_spark_test_app/themes.dart';

import 'my_buttons.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: "Technospark test app",
      theme: ThemeData.light(useMaterial3: true),
      home: ChangeNotifierProvider(
        create: (context) => ContentModel(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PageThemeWidget(
      child: Scaffold(
        body: SafeArea(
          child: HomePageContent(),
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Show message for too small screens
    if (MediaQuery.of(context).size.shortestSide < 300) {
      return const Center(
        child: Text("Too small screen"),
      );
    }
    // On desktops we show only vertical layout
    if (Helpers.isDesktopDevice) {
      return const DesktopLayout(
        child: OrientedContent(orientation: Orientation.portrait),
      );
    }
    // For mobile/web layout changes based on orientation
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OrientationBuilder(builder: (context, orientation) {
        return OrientedContent(
          orientation: orientation,
        );
      }),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  final Widget child;
  const DesktopLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MediaQuery.of(context).size.width < 600
          ? child
          : Row(
              children: [
                Spacer(
                  flex: Helpers.responsiveWidthValue<int>(context,
                      small: 1, medium: 1, large: 2),
                ),
                Expanded(
                  flex: Helpers.responsiveWidthValue<int>(context,
                      small: 8, medium: 6, large: 4),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 900,
                      ),
                      child: child,
                    ),
                  ),
                ),
                Spacer(
                  flex: Helpers.responsiveWidthValue<int>(context,
                      small: 1, medium: 1, large: 2),
                ),
              ],
            ),
    );
  }
}

class OrientedContent extends StatelessWidget {
  final Orientation orientation;
  const OrientedContent({
    super.key,
    required this.orientation,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: (orientation == Orientation.landscape)
          ? Axis.horizontal
          : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        (orientation == Orientation.portrait)
            ? const MyButtons()
            : const Expanded(
                flex: 2,
                child: MyButtons(),
              ),
        if (orientation == Orientation.portrait)
          const Divider(
            indent: 40,
            endIndent: 40,
          ),
        if (orientation == Orientation.landscape)
          const VerticalDivider(
            indent: 40,
            endIndent: 40,
          ),
        Expanded(
          flex: 3,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<ContentModel>(
                        builder: (context, value, child) {
                          if (value.text != null) {
                            return Text(
                              value.text!,
                            );
                          }
                          if (value.assetPath != null) {
                            return Image.asset(value.assetPath!);
                          }
                          return const Text("Nothing to show");
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
