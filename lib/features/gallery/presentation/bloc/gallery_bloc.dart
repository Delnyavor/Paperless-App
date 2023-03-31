import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:paperless_app/features/gallery/domain/usecases/get_images.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/network_image_data.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GetImages getImages;

  GalleryBloc({required this.getImages}) : super(const GalleryState()) {
    on<GetImagesEvent>(_onGetImagesEvent);
  }

  void _onGetImagesEvent(
      GetImagesEvent event, Emitter<GalleryState> emit) async {
    if (state.data.isEmpty) {
      emit(
        state.copyWith(
          status: GalleryStatus.loading,
        ),
      );
    }
    final result = await getImages();

    result!.fold((l) async {
      handleFailure(l, emit);
    }, (r) async {
      handleSuccess(r, emit);
    });
  }

  void handleFailure(Failure failure, Emitter<GalleryState> emit) {
    emit(
      state.copyWith(
        status: GalleryStatus.error,
        // errorMessage: failure.message,
      ),
    );
  }

  void handleSuccess(
      List<NetworkImageData>? result, Emitter<GalleryState> emit) {
    emit(
      state.copyWith(
        status: GalleryStatus.successful,
        data: result,
      ),
    );
  }
}
