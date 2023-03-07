import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../widgets/show_snack.dart';
import '../cubit/payment_cubit.dart';
import '../../../../app/di.dart' as di;

class TogglePage extends StatelessWidget {
  const TogglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.instance<PaymentCubit>(),
      child: SafeArea(
        child: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {
            if (state is PaymentRefCodeSuccessStates) {
              showSnackBar(
                context: context,
                text: "Success get ref code ",
                color: Colors.amber.shade400,
              );

              Navigator.pushNamed(context, Routes.referenceRoute);
            }
            if (state is PaymentRefCodeErrorStates) {
              showSnackBar(
                context: context,
                text: "Error get ref code ",
                color: Colors.red,
              );
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                                Border.all(color: Colors.black87, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: NetworkImage(ImageAssets.refCodeImage),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Payment with Ref code',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.visaRoute);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Image(
                                image: NetworkImage(ImageAssets.visaImage),
                              ),
                              Text(
                                'Payment with visa',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
