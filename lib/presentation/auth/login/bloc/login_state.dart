part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final bool visibleIcon;
  final Status firebaseStatus;
  final bool isUserSignIn;


  const LoginState(
      {this.visibleIcon = false, this.firebaseStatus = Status.initial,this.isUserSignIn=false});

  LoginState copyWith({bool? visibleIcon, Status? firebaseStatus,bool? isUserSignIn}) {
    return LoginState(
        visibleIcon: visibleIcon ?? this.visibleIcon,
        firebaseStatus: firebaseStatus ?? this.firebaseStatus,
        isUserSignIn:isUserSignIn??this.isUserSignIn);
  }

  @override
  List<Object?> get props => [visibleIcon,firebaseStatus,isUserSignIn];
}

enum Status {
  initial,
  success,
  loading,
  error,
}

extension FirebaseStatus on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
