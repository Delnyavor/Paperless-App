import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:paperless_app/features/kyc/domain/entities/identifier.dart';

import '../../domain/usecases/upload_usecase.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  final UploadKYC uploadKyc;

  KycBloc({required this.uploadKyc}) : super(const KycState()) {
    on<UploadKycEvent>(_onUploadKycEvent);
    on<UpdateFrontImgEvent>(_onUpdateFrontImgEvent);
    on<UpdateBackImgEvent>(_onUpdateBackImgEvent);
    on<UpdateDocumentTypeEvent>(_onUpdateDocumentTypeEvent);
    on<Reset>(_onReset);
  }

  void _onReset(Reset event, Emitter<KycState> emit) async {
    emit(state.copyWith(status: KYCPageStatus.empty, front: null, back: null));
  }

  void _onUploadKycEvent(UploadKycEvent event, Emitter<KycState> emit) async {
    emit(state.copyWith(status: KYCPageStatus.loading));
    //

    if (state.front == null || state.back == null) {
      emit(state.copyWith(status: KYCPageStatus.error));

      //
    } else {
      final Identifier id = Identifier(
        type: state.type ?? DocumentType.id,
        front: state.front!,
        back: state.back!,
      );

      final result = await uploadKyc(id: id);

      if (result != null) {
        emit(state.copyWith(status: KYCPageStatus.failed));
      } else {
        emit(state.copyWith(status: KYCPageStatus.successful));
      }
    }
  }

  void _onUpdateFrontImgEvent(
      UpdateFrontImgEvent event, Emitter<KycState> emit) async {
    emit(state.copyWith(front: event.file));
  }

  void _onUpdateBackImgEvent(
      UpdateBackImgEvent event, Emitter<KycState> emit) async {
    emit(state.copyWith(back: event.file));
  }

  void _onUpdateDocumentTypeEvent(
      UpdateDocumentTypeEvent event, Emitter<KycState> emit) async {
    emit(
      state.copyWith(
        type: event.type,
      ),
    );
  }
}
