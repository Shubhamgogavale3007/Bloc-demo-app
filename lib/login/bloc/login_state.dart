abstract class LoginInState{}


class LoginInInitialState extends LoginInState{}


class LoginInValidState extends LoginInState{}


class LoginInInvalidState extends LoginInState{}


class LoginInErrorState extends LoginInState{
  late String errorMessage;
  LoginInErrorState(this.errorMessage);
}

class LoginInLoadingState extends LoginInState{}
