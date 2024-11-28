import '/backend/backend.dart';
import '/buttons/category_button/category_button_widget.dart';
import '/buttons/help_button/help_button_widget.dart';
import '/components/navigation_bar_bottom/navigation_bar_bottom_widget.dart';
import '/components/restaurantinfo/restaurantinfo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for helpButton component.
  late HelpButtonModel helpButtonModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<RestaurantsRecord> simpleSearchResults = [];
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for categoryButton component.
  late CategoryButtonModel categoryButtonModel1;
  // Model for categoryButton component.
  late CategoryButtonModel categoryButtonModel2;
  // Model for categoryButton component.
  late CategoryButtonModel categoryButtonModel3;
  // Model for categoryButton component.
  late CategoryButtonModel categoryButtonModel4;
  // Model for categoryButton component.
  late CategoryButtonModel categoryButtonModel5;
  // Model for categoryButton component.
  late CategoryButtonModel categoryButtonModel6;
  // Models for restaurantinfo dynamic component.
  late FlutterFlowDynamicModels<RestaurantinfoModel> restaurantinfoModels;
  // Model for navigationBarBottom component.
  late NavigationBarBottomModel navigationBarBottomModel;

  @override
  void initState(BuildContext context) {
    helpButtonModel = createModel(context, () => HelpButtonModel());
    categoryButtonModel1 = createModel(context, () => CategoryButtonModel());
    categoryButtonModel2 = createModel(context, () => CategoryButtonModel());
    categoryButtonModel3 = createModel(context, () => CategoryButtonModel());
    categoryButtonModel4 = createModel(context, () => CategoryButtonModel());
    categoryButtonModel5 = createModel(context, () => CategoryButtonModel());
    categoryButtonModel6 = createModel(context, () => CategoryButtonModel());
    restaurantinfoModels =
        FlutterFlowDynamicModels(() => RestaurantinfoModel());
    navigationBarBottomModel =
        createModel(context, () => NavigationBarBottomModel());
  }

  @override
  void dispose() {
    helpButtonModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    categoryButtonModel1.dispose();
    categoryButtonModel2.dispose();
    categoryButtonModel3.dispose();
    categoryButtonModel4.dispose();
    categoryButtonModel5.dispose();
    categoryButtonModel6.dispose();
    restaurantinfoModels.dispose();
    navigationBarBottomModel.dispose();
  }
}
