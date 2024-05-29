import 'package:flutter/material.dart';
import 'package:mobile_ui/presentation/Widget/User_Job.dart';
import 'package:mobile_ui/presentation/Widget/User_Review.dart';
import 'package:mobile_ui/presentation/Widget/theme_notifier.dart';
import 'package:mobile_ui/presentation/Widget/themes.dart';
import 'package:provider/provider.dart';

class GetTabBar extends StatefulWidget {
  @override
  _GetTabBarState createState() => _GetTabBarState();
}

class _GetTabBarState extends State<GetTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor:
            Provider.of<ThemeProvider>(context).getTheme == darkTheme
                ? Colors.grey[900]
                : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading:
                false, // This line removes the back arrow
            backgroundColor:
                Provider.of<ThemeProvider>(context).getTheme == darkTheme
                    ? Colors.grey[900]
                    : Colors.white,
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.work,
                    color: Provider.of<ThemeProvider>(context).getTheme ==
                            darkTheme
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.reviews,
                    color: Provider.of<ThemeProvider>(context).getTheme ==
                            darkTheme
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
              indicator: CustomTabIndicator(
                tabBarIndicatorSize: 20,
                tabBarIndicatorColor:
                    Provider.of<ThemeProvider>(context).getTheme == darkTheme
                        ? Colors.orange
                        : Colors.purple,
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Navigator(
              initialRoute: '/uploads',
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/uploads':
                    return MaterialPageRoute(builder: (_) => Uploads());
                  default:
                    return null;
                }
              },
            ),
            Navigator(
              initialRoute: '/tags',
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/tags':
                    return MaterialPageRoute(builder: (_) => Tags());
                  default:
                    return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final double tabBarIndicatorSize;
  final Color tabBarIndicatorColor;

  const CustomTabIndicator({
    required this.tabBarIndicatorSize,
    required this.tabBarIndicatorColor,
  });

  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      tabBarIndicatorSize: tabBarIndicatorSize,
      tabBarIndicatorColor: tabBarIndicatorColor,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final double tabBarIndicatorSize;
  final Color tabBarIndicatorColor;

  _CustomPainter({
    required this.tabBarIndicatorSize,
    required this.tabBarIndicatorColor,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = tabBarIndicatorColor;
    final Rect rect = Rect.fromLTWH(
      offset.dx + configuration.size!.width / 2 - tabBarIndicatorSize / 2,
      configuration.size!.height - 5, // Position the indicator at the bottom
      tabBarIndicatorSize,
      3, // Height of the indicator
    );
    canvas.drawRect(rect, paint);
  }
}
