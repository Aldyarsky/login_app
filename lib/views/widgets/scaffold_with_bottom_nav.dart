import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app/app/routing/route_names.dart';

class ScaffoldWithBottomNav extends StatefulWidget {
  const ScaffoldWithBottomNav({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<ScaffoldWithBottomNav> createState() => _ScaffoldWithBottomNavState();
}

class _ScaffoldWithBottomNavState extends State<ScaffoldWithBottomNav> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              context.go('/feed');
              setState(() {
                currentIndex = value;
              });

              break;
            case 1:
              context.go('/map');
              setState(() {
                currentIndex = value;
              });

              break;
            case 2:
              context.go('/favourites');
              setState(() {
                currentIndex = value;
              });

              break;
            case 3:
              context.goNamed(RouteNames.profile);
              setState(() {
                currentIndex = value;
              });

              break;
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.list_bullet),
            label: AppLocalizations.of(context)!.feed,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.map),
            label: AppLocalizations.of(context)!.map,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.heart),
            label: AppLocalizations.of(context)!.favourites,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.profile_circled),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
