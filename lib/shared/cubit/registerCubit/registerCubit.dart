import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/registerCubit/registerStatus.dart';

class registerCubit extends Cubit<registerStatus> {
  registerCubit() : super(registerInitStatus());
  static registerCubit get(context) => BlocProvider.of(context);
}
