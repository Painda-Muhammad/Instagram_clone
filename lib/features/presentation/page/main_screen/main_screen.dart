import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone_app/features/presentation/page/activity/activity_page.dart';
import 'package:instagram_clone_app/features/presentation/page/post/upload_post_page.dart';
import 'package:instagram_clone_app/features/presentation/page/profile/profile_page.dart';
import 'package:instagram_clone_app/features/presentation/page/search/search_page.dart';
import '../../../../consts.dart';
import '../../cubit/user/get_single_user/get_single_user_cubit.dart';
import '../home/home_page.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({super.key, required this.uid});
  final String uid;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleUserCubit, GetSingleUserState>(
      builder: (context, getSingleUserState) {
        if (getSingleUserState is GetSingleUserLoaded) {
          final currentUser = getSingleUserState.user;
          return Scaffold(
            backgroundColor: backGroundColor,
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: backGroundColor,
              items:const [
              BottomNavigationBarItem(
                  // icon: Icon(MaterialCommunityIcons.home_variant, color: primaryColor),label: ""
                  icon: Icon(Icons.home_max_outlined,color: primaryColor,)
                    
                   ),
              BottomNavigationBarItem(
                  // icon: Icon(Ionicons.md_search, color: primaryColor), label: ""
                  icon: Icon(Icons.search,color: primaryColor,)
                  ),
                BottomNavigationBarItem(
                  // icon: Icon(Ionicons.md_add_circle, color: primaryColor), label: ""
                  icon: Icon(Icons.add_circle_outline_outlined,color: primaryColor,)
                  
                  ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, color: primaryColor), label: "",
                  ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined, color: primaryColor), label: ""
                  ),

              ],
              onTap: navigationTapped,
            ),
            body: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                const HomePage(),
                const SearchPage(),
                UploadPostPage(currentUser: currentUser),
                const ActivityPage(),
                ProfilePage(currentUser: currentUser,)
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
