import 'package:demo/Data/login_provider.dart';
import 'package:demo/Data/post_provider.dart';
import 'package:demo/Data/product_provider.dart';
import 'package:demo/pages/login.dart';
import 'package:demo/pages/posts.dart';
import 'package:demo/pages/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Side menu state management
class SideMenuModel extends ChangeNotifier {
  int selectedIndex = 0; // Assuming initial selection is 0

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners(); // Notify listeners when state changes
  }
}

// InheritedWidget to access side menu state
class SideMenuState extends InheritedWidget {
  final SideMenuModel sideMenuModel;

  const SideMenuState({
    Key? key,
    required this.sideMenuModel,
    required Widget child,
  }) : super(key: key, child: child);

  static SideMenuState of(BuildContext context) {
    final sideMenuState =
        context.dependOnInheritedWidgetOfExactType<SideMenuState>();
    if (sideMenuState == null) {
      throw Exception('No SideMenuState found in context');
    }
    return sideMenuState;
  }

  @override
  bool updateShouldNotify(SideMenuState oldWidget) {
    return sideMenuModel != oldWidget.sideMenuModel;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostsProvider>(
          create: (context) => PostsProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        home: const Login(),
      ),
    );
  }
}
