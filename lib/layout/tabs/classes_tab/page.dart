import 'package:alo_movies/layout/tabs/classes_tab/cubit/classes_cubit.dart';
import 'package:alo_movies/shared/components/classes_item/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesTab extends StatelessWidget {
  const ClassesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClassesCubit, ClassesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ClassesLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is ClassesLoaded) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: state.classesModel.length,
            itemBuilder: (context, index) => ClassesItem(
              number: index + 1,
              classesModel: state.classesModel[index],
            ),
          );
        }
        if (state is ClassesCantLoad) {
          return Center(child: Text(state.msg));
        }
        return const SizedBox();
      },
    );
  }
}
