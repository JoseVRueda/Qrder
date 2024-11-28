import '/buttons/help_button/help_button_widget.dart';
import '/components/product/product_widget.dart';
import '/components/total_cart/total_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_widget.dart' show MenuWidget;
import 'package:flutter/material.dart';

class MenuModel extends FlutterFlowModel<MenuWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUniqueCategories] action in menu widget.
  List<String>? categories;
  // Model for helpButton component.
  late HelpButtonModel helpButtonModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for product dynamic component.
  late FlutterFlowDynamicModels<ProductModel> productModels1;
  // Models for product dynamic component.
  late FlutterFlowDynamicModels<ProductModel> productModels2;
  // Models for product dynamic component.
  late FlutterFlowDynamicModels<ProductModel> productModels3;
  // Model for totalCart component.
  late TotalCartModel totalCartModel;

  @override
  void initState(BuildContext context) {
    helpButtonModel = createModel(context, () => HelpButtonModel());
    productModels1 = FlutterFlowDynamicModels(() => ProductModel());
    productModels2 = FlutterFlowDynamicModels(() => ProductModel());
    productModels3 = FlutterFlowDynamicModels(() => ProductModel());
    totalCartModel = createModel(context, () => TotalCartModel());
  }

  @override
  void dispose() {
    helpButtonModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    productModels1.dispose();
    productModels2.dispose();
    productModels3.dispose();
    totalCartModel.dispose();
  }
}
