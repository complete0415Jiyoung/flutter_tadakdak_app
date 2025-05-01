// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpAction implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction()';
}


}

/// @nodoc
class $SignUpActionCopyWith<$Res>  {
$SignUpActionCopyWith(SignUpAction _, $Res Function(SignUpAction) __);
}


/// @nodoc


class TogglePasswordVisibility with DiagnosticableTreeMixin implements SignUpAction {
  const TogglePasswordVisibility();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction.togglePasswordVisibility'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TogglePasswordVisibility);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction.togglePasswordVisibility()';
}


}




/// @nodoc


class ToggleConfirmPasswordVisibility with DiagnosticableTreeMixin implements SignUpAction {
  const ToggleConfirmPasswordVisibility();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction.toggleConfirmPasswordVisibility'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleConfirmPasswordVisibility);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction.toggleConfirmPasswordVisibility()';
}


}




/// @nodoc


class SignUp with DiagnosticableTreeMixin implements SignUpAction {
  const SignUp({required this.email, required this.password, required this.name});
  

 final  String email;
 final  String password;
 final  String name;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpCopyWith<SignUp> get copyWith => _$SignUpCopyWithImpl<SignUp>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction.signUp'))
    ..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('password', password))..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUp&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction.signUp(email: $email, password: $password, name: $name)';
}


}

/// @nodoc
abstract mixin class $SignUpCopyWith<$Res> implements $SignUpActionCopyWith<$Res> {
  factory $SignUpCopyWith(SignUp value, $Res Function(SignUp) _then) = _$SignUpCopyWithImpl;
@useResult
$Res call({
 String email, String password, String name
});




}
/// @nodoc
class _$SignUpCopyWithImpl<$Res>
    implements $SignUpCopyWith<$Res> {
  _$SignUpCopyWithImpl(this._self, this._then);

  final SignUp _self;
  final $Res Function(SignUp) _then;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? name = null,}) {
  return _then(SignUp(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EmailChanged with DiagnosticableTreeMixin implements SignUpAction {
  const EmailChanged(this.email);
  

 final  String email;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailChangedCopyWith<EmailChanged> get copyWith => _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction.emailChanged'))
    ..add(DiagnosticsProperty('email', email));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class $EmailChangedCopyWith<$Res> implements $SignUpActionCopyWith<$Res> {
  factory $EmailChangedCopyWith(EmailChanged value, $Res Function(EmailChanged) _then) = _$EmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(this._self, this._then);

  final EmailChanged _self;
  final $Res Function(EmailChanged) _then;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(EmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PasswordChanged with DiagnosticableTreeMixin implements SignUpAction {
  const PasswordChanged(this.password);
  

 final  String password;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordChangedCopyWith<PasswordChanged> get copyWith => _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction.passwordChanged'))
    ..add(DiagnosticsProperty('password', password));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $PasswordChangedCopyWith<$Res> implements $SignUpActionCopyWith<$Res> {
  factory $PasswordChangedCopyWith(PasswordChanged value, $Res Function(PasswordChanged) _then) = _$PasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(this._self, this._then);

  final PasswordChanged _self;
  final $Res Function(PasswordChanged) _then;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(PasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfirmPasswordChanged with DiagnosticableTreeMixin implements SignUpAction {
  const ConfirmPasswordChanged(this.confirmPassword);
  

 final  String confirmPassword;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmPasswordChangedCopyWith<ConfirmPasswordChanged> get copyWith => _$ConfirmPasswordChangedCopyWithImpl<ConfirmPasswordChanged>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction.confirmPasswordChanged'))
    ..add(DiagnosticsProperty('confirmPassword', confirmPassword));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmPasswordChanged&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,confirmPassword);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction.confirmPasswordChanged(confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $ConfirmPasswordChangedCopyWith<$Res> implements $SignUpActionCopyWith<$Res> {
  factory $ConfirmPasswordChangedCopyWith(ConfirmPasswordChanged value, $Res Function(ConfirmPasswordChanged) _then) = _$ConfirmPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String confirmPassword
});




}
/// @nodoc
class _$ConfirmPasswordChangedCopyWithImpl<$Res>
    implements $ConfirmPasswordChangedCopyWith<$Res> {
  _$ConfirmPasswordChangedCopyWithImpl(this._self, this._then);

  final ConfirmPasswordChanged _self;
  final $Res Function(ConfirmPasswordChanged) _then;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? confirmPassword = null,}) {
  return _then(ConfirmPasswordChanged(
null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NameChanged with DiagnosticableTreeMixin implements SignUpAction {
  const NameChanged(this.name);
  

 final  String name;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NameChangedCopyWith<NameChanged> get copyWith => _$NameChangedCopyWithImpl<NameChanged>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction.nameChanged'))
    ..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NameChanged&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class $NameChangedCopyWith<$Res> implements $SignUpActionCopyWith<$Res> {
  factory $NameChangedCopyWith(NameChanged value, $Res Function(NameChanged) _then) = _$NameChangedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$NameChangedCopyWithImpl<$Res>
    implements $NameChangedCopyWith<$Res> {
  _$NameChangedCopyWithImpl(this._self, this._then);

  final NameChanged _self;
  final $Res Function(NameChanged) _then;

/// Create a copy of SignUpAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(NameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ValidateForm with DiagnosticableTreeMixin implements SignUpAction {
  const ValidateForm();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SignUpAction.validateForm'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidateForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SignUpAction.validateForm()';
}


}




// dart format on
