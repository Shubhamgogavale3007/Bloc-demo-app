import 'package:bloc_loginform_demo/login/bloc/login_event.dart';
import 'package:bloc_loginform_demo/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent,LoginInState>{
       LoginBloc() :  super(LoginInInitialState()){

         on<LoginTextChangedEvent>((event, emit){
           if(event.emailValue == ""   ){
             emit(LoginInErrorState("Please enter valid email address"));
           }
           else if(event.passwordValue.length < 7){
             emit(LoginInErrorState("Please enter valid password"));
           }else{
             emit(LoginInValidState());
           }

         });
         on<LoginSubmittedEvent>((event, emit) {
           emit(LoginInLoadingState());

         });

       }
}