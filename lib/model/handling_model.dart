// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:state_managment_bloc/model/product_model.dart';

class ResultModel {}

class HandlingModel extends ResultModel {}

class ListOfModels<T>  extends ResultModel {
  List<T> products;
  ListOfModels({
    required this.products,
  });
}
