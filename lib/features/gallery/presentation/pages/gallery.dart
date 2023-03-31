import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/gallery_bloc.dart';
import '../widgets/gallery_banner.dart';
import '../widgets/gallery_img.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  createState() => _GalleryPage();
}

class _GalleryPage extends State<GalleryPage> {
  late GalleryBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<GalleryBloc>(context);
    bloc.add(const GetImagesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      return Scaffold(
          body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: GalleryBanner(),
          ),
          SliverToBoxAdapter(
            child: Column(children: [sectionTitle(context)]),
          ),
          state.data.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1),
                  itemBuilder: (context, index) {
                    return GalleryImg(url: state.data[index].url);
                  },
                  itemCount: state.data.length,
                ),
        ],
      ));
    });
  }

  Widget sectionTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey[300]!, width: 1),
      )),
      child: Text(
        'Gallery',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget imagesBuilder() {
    return BlocBuilder<GalleryBloc, GalleryState>(
      builder: (context, state) {
        return ListView(
          children: state.data.map((e) => GalleryImg(url: e.url)).toList(),
        );
      },
    );
  }

  Widget backgroundBuilder() {
    return BlocBuilder<GalleryBloc, GalleryState>(
      builder: (context, state) {
        return state.data.isNotEmpty
            ? Image.network(
                state.data.first.url,
                fit: BoxFit.cover,
              )
            : const SizedBox.shrink();
      },
    );
  }
}
