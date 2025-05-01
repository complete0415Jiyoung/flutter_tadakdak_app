import 'package:flutter/widgets.dart';

import 'package:tadaktak_app/presentation/screen/home/home_screen.dart';

class HomeScreenRoot extends StatefulWidget {
  const HomeScreenRoot({super.key});

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  @override
  Widget build(BuildContext context) {
    // return ListenableBuilder(
    //   listenable: widget.viewModel,
    //   builder: (context, child) {
    //     return HomeScreen();
    //   },
    // );
    return HomeScreen();
  }
}
