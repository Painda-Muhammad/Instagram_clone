import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_app/consts.dart';
import 'package:instagram_clone_app/features/domain/entities/posts/post_entity.dart';
import 'package:instagram_clone_app/features/presentation/cubit/post/post_cubit.dart';
import 'package:instagram_clone_app/features/presentation/page/home/widgets/single_post_card_widget.dart';
import 'package:instagram_clone_app/injection_container.dart' as di;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: SvgPicture.asset("assets/ic_instagram.svg", color: primaryColor, height: 32,),
        actions: const [
          Padding(
            padding:  EdgeInsets.only(right: 10.0),
            // child: Icon(MaterialCommunityIcons.facebook_messenger, color: primaryColor,),
            child: 
                    Icon(Icons.messenger,color: primaryColor,)
          )
        ],
      ),
      body: BlocProvider<PostCubit>(
        create: (context) =>
        di.sl<PostCubit>()
          ..getPosts(post:const PostEntity()),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, postState) {
            if (postState is PostLoading) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if (postState is PostFailure) {
              toast("Some Failure occured while creating the post");
            }
            if (postState is PostLoaded) {
              return postState.posts.isEmpty? _noPostsYetWidget() : ListView.builder(
                itemCount: postState.posts.length,
                itemBuilder: (context, index) {
                  final post = postState.posts[index];
                  return BlocProvider(
                    create: (context) => di.sl<PostCubit>(),
                    child: SinglePostCardWidget(post: post),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }

  _noPostsYetWidget() {
    return const Center(child: Text("No Posts Yet", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),);
  }
}
