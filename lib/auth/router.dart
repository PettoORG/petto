// lib/auth/router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petto/auth/presentation/screens/sign_in_screen.dart';
import 'package:petto/auth/presentation/screens/sign_up_screen.dart';
import 'package:petto/auth/presentation/screens/forgot_password_screen.dart';
import 'package:petto/auth/presentation/screens/email_verification_screen.dart';

part 'router.g.dart';

@TypedGoRoute<SignInRoute>(
  path: '/signin',
)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

@TypedGoRoute<SignUpRoute>(
  path: '/signup',
)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}

@TypedGoRoute<ForgotPasswordRoute>(
  path: '/forgotPassword',
)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPasswordScreen();
  }
}

@TypedGoRoute<EmailVerificationRoute>(
  path: '/emailVerification',
)
class EmailVerificationRoute extends GoRouteData {
  const EmailVerificationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EmailVerificationScreen();
  }
}
