import 'package:equatable/equatable.dart';

class AuthRequest extends Equatable {
  final String token;
  const AuthRequest({
    required this.token,
  });

  @override
  List<Object?> get props => [token];
}
