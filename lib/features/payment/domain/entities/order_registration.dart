import 'package:equatable/equatable.dart';

class OrderRegistration extends Equatable {
  final int id;
  const OrderRegistration({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
