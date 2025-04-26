import 'package:flutter/widgets.dart';
import 'package:tadaktak_app/presentation/screen/home/home_view_model.dart';
import 'package:tadaktak_app/presentation/screen/home/screen/home_screen.dart';

class HomeScreenRoot extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeScreenRoot({super.key, required this.viewModel});

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return HomeScreen();
      },
    );
  }
}
