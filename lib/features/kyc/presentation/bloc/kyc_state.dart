part of 'kyc_bloc.dart';

class KycState extends Equatable {
  const KycState(
      {this.front, this.back, this.status = KYCPageStatus.empty, this.type});

  final KYCPageStatus status;
  final File? front;
  final File? back;
  final DocumentType? type;

  KycState copyWith(
      {KYCPageStatus? status, File? front, File? back, DocumentType? type}) {
    return KycState(
      status: status ?? this.status,
      front: front ?? this.front,
      back: back ?? this.back,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [status, front, back, type];
}

enum KYCPageStatus { loading, failed, error, successful, empty }
