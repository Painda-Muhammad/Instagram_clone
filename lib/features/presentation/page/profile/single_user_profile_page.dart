import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone_app/features/presentation/cubit/post/post_cubit.dart';
import 'package:instagram_clone_app/features/presentation/page/profile/widgets/single_user_profile_main_widget.dart';
import 'package:instagram_clone_app/injection_container.dart' as di;

class SingleUserProfilePage extends StatelessWidget {
  final String otherUserId;

  const SingleUserProfilePage({super.key, required this.otherUserId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (context) => di.sl<PostCubit>(),
        ),
      ],
      child: SingleUserProfileMainWidget(otherUserId: otherUserId),
    );
  }
}
