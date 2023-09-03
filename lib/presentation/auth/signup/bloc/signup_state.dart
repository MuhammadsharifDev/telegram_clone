part of 'signup_bloc.dart';

class SignupState extends Equatable {
  bool visibleIcon;
  final Status firebaseStatus;


  SignupState({
    this.visibleIcon = false,
    required this.firebaseStatus,

  });

  SignupState copyWith({
    bool? visibleIcon,
    Status? firebaseStatus,

  }) {
    return SignupState(
      visibleIcon: visibleIcon ?? this.visibleIcon,
      firebaseStatus: Status.initial,

    );
  }

  @override
  List<Object?> get props => [visibleIcon, firebaseStatus, ];
}

enum Status { initial, loading, success, error }

extension FireebaseStatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
