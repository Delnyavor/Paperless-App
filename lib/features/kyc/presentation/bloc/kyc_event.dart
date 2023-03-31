part of 'kyc_bloc.dart';

abstract class KycEvent extends Equatable {
  const KycEvent();

  @override
  List<Object> get props => [];
}

class UploadKycEvent extends KycEvent {
  const UploadKycEvent();
}

class UpdateDocumentTypeEvent extends KycEvent {
  final DocumentType? type;
  const UpdateDocumentTypeEvent({required this.type});
}

class UpdateFrontImgEvent extends KycEvent {
  final File? file;
  const UpdateFrontImgEvent({required this.file});
}

class UpdateBackImgEvent extends KycEvent {
  final File? file;
  const UpdateBackImgEvent({required this.file});
}

class Reset extends KycEvent {
  const Reset();
}
