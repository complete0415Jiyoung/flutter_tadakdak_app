// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpState {

 bool get isLoading; String? get errorMessage; bool get isPasswordVisible; bool get isConfirmPasswordVisible; String get email; String get password; String get confirmPassword; String get name; String? get emailError; String? get passwordError; String? get confirmPasswordError; String? get nameError; bool get isFormValid;
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateCopyWith<SignUpState> get copyWith => _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.name, name) || other.name == name)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,isPasswordVisible,isConfirmPasswordVisible,email,password,confirmPassword,name,emailError,passwordError,confirmPasswordError,nameError,isFormValid);

@override
String toString() {
  return 'SignUpState(isLoading: $isLoading, errorMessage: $errorMessage, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, email: $email, password: $password, confirmPassword: $confirmPassword, name: $name, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, nameError: $nameError, isFormValid: $isFormValid)';
}


}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res>  {
  factory $SignUpStateCopyWith(SignUpState value, $Res Function(SignUpState) _then) = _$SignUpStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? errorMessage, bool isPasswordVisible, bool isConfirmPasswordVisible, String email, String password, String confirmPassword, String name, bool isFormValid, String? emailError, String? passwordError, String? confirmPasswordError, String? nameError
});




}
/// @nodoc
class _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? name = null,Object? isFormValid = null,Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? nameError = freezed,}) {
  return _then(SignUpState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


// dart format on
