import '/buttons/help_button/help_button_widget.dart';
import '/components/cart_item/cart_item_widget.dart';
import '/components/total_bill/total_bill_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shopping_cart_widget.dart' show ShoppingCartWidget;
import 'package:flutter/material.dart';

class ShoppingCartModel extends FlutterFlowModel<ShoppingCartWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for helpButton component.
  late HelpButtonModel helpButtonModel;
  // Models for cartItem dynamic component.
  late FlutterFlowDynamicModels<CartItemModel> cartItemModels;
  // Model for totalBill component.
  late TotalBillModel totalBillModel;

  @override
  void initState(BuildContext context) {
    helpButtonModel = createModel(context, () => HelpButtonModel());
    cartItemModels = FlutterFlowDynamicModels(() => CartItemModel());
    totalBillModel = createModel(context, () => TotalBillModel());
  }

  @override
  void dispose() {
    helpButtonModel.dispose();
    cartItemModels.dispose();
    totalBillModel.dispose();
  }
}
