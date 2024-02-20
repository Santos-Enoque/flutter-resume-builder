import 'package:app_ui/app_ui.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditorView extends StatelessWidget {
  const EditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditorPage();
  }
}

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = context.select((ThemeCubit cubit) => cubit.state);
    const width = 560.0;
    return Scaffold(
      body: FlexiLayout(
        layout: Dashboard(
          title: 'My Resume',
          rightSideMenu: const SideMenu(
            isLeft: false,
            child: Center(
              child: Text('Right Side Menu'),
            ),
          ),
          leftSideMenu: SideMenu(
            defaultPage: Editor(
              width: width,
              mode: mode,
            ),
            child: const Center(
              child: Text('Left Side Menu'),
            ),
          ),
        ),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  const Editor({
    super.key,
    required this.width,
    required this.mode,
  });

  final double width;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  A4PaperContainer(width: width, mode: mode),
                  const SizedBox(
                    height: 8,
                  ),
                  A4PaperContainer(width: width, mode: mode),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class A4PaperContainer extends StatelessWidget {
  const A4PaperContainer({
    required this.width,
    required this.mode,
    super.key,
  });

  final double width;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Page 1'),
              Row(
                children: [
                  AppIconButton(
                    onPressed: () {},
                    icon: Icons.arrow_upward_outlined,
                  ),
                  AppIconButton(
                    onPressed: () {},
                    icon: Icons.arrow_downward_outlined,
                  ),
                  AppIconButton(
                    onPressed: () {},
                    icon: Icons.content_copy_outlined,
                  ),
                  AppIconButton(
                    onPressed: () {},
                    icon: Icons.delete_outline_outlined,
                  ),
                  AppIconButton(
                    onPressed: () {},
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          width: width,
          height: width * 1.414,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(4, 8),
                blurRadius: 10,
                // spreadRadius: 2,
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            color: Colors.blue,
            icon: mode == ThemeMode.light
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
          // Define the actual size constraints if necessary, or let it fill the available space
        ),
      ],
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
      ),
    );
  }
}

class Pane extends StatelessWidget {
  const Pane({
    required this.width,
    required this.height,
    required this.borderRadius,
    super.key,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(.5),
          width: 0.3,
        ),
      ),
    );
  }
}
