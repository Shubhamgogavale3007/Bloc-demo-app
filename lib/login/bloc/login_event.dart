abstract class LoginEvent{}

  class LoginTextChangedEvent extends LoginEvent{
  late  String emailValue;
  late  String passwordValue;
  LoginTextChangedEvent(this.emailValue,this.passwordValue);
  }





  class LoginSubmittedEvent extends LoginEvent{
    late  String email;
    late  String password;
    LoginSubmittedEvent(this.email,this.password);

  }

