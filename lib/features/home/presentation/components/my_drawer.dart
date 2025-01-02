import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/home/presentation/components/my_drawer_tile.dart';
import 'package:social_media/features/profile/presentation/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // LOGO
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                // DIVIDER LINE
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // HOME TILE
                MyDrawerTile(
                  title: 'H O M E',
                  icon: Icons.home,
                  onTap: () => Navigator.of(context).pop(),
                ),

                // PROFILE TILE
                MyDrawerTile(
                  title: 'P R O F I L E',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                ),

                // SEARCH TILE
                MyDrawerTile(
                  title: 'S E A R C H',
                  icon: Icons.search,
                  onTap: () {},
                ),

                // SETTINGS TILE
                MyDrawerTile(
                  title: 'S E T T I N G S',
                  icon: Icons.settings,
                  onTap: () {},
                ),

                const Spacer(),
                // LOGOUT TILE
                MyDrawerTile(
                  title: 'L O G O U T',
                  icon: Icons.login,
                  onTap: () => context.read<AuthCubit>().logout,
                ),
              ],
            ),
          ),
        ));
  }
}
