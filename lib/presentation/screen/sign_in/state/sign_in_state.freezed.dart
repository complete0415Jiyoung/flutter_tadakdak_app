// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInState {

 bool get isLoading; bool get isPasswordVisible; String get email; String get password; bool get isFormValid; String? get errorMessage; String? get emailError; String? get passwordError;
/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInStateCopyWith<SignInState> get copyWith => _$SignInStateCopyWithImpl<SignInState>(this as SignInState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isPasswordVisible,email,password,isFormValid,errorMessage,emailError,passwordError);

@override
String toString() {
  return 'SignInState(isLoading: $isLoading, isPasswordVisible: $isPasswordVisible, email: $email, password: $password, isFormValid: $isFormValid, errorMessage: $errorMessage, emailError: $emailError, passwordError: $passwordError)';
}


}

/// @nodoc
abstract mixin class $SignInStateCopyWith<$Res>  {
  factory $SignInStateCopyWith(SignInState value, $Res Function(SignInState) _then) = _$SignInStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isPasswordVisible, String email, String password, bool isFormValid, String? errorMessage, String? emailError, String? passwordError
});




}
/// @nodoc
class _$SignInStateCopyWithImpl<$Res>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._self, this._then);

  final SignInState _self;
  final $Res Function(SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isPasswordVisible = null,Object? email = null,Object? password = null,Object? isFormValid = null,Object? errorMessage = freezed,Object? emailError = freezed,Object? passwordError = freezed,}) {
  return _then(SignInState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


// dart format on
