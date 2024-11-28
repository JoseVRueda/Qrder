import '/buttons/navigation_button/navigation_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'navigation_bar_bottom_widget.dart' show NavigationBarBottomWidget;
import 'package:flutter/material.dart';

class NavigationBarBottomModel
    extends FlutterFlowModel<NavigationBarBottomWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for navigationButton component.
  late NavigationButtonModel navigationButtonModel1;
  // Model for navigationButton component.
  late NavigationButtonModel navigationButtonModel2;
  // Model for navigationButton component.
  late NavigationButtonModel navigationButtonModel3;

  @override
  void initState(BuildContext context) {
    navigationButtonModel1 =
        createModel(context, () => NavigationButtonModel());
    navigationButtonModel2 =
        createModel(context, () => NavigationButtonModel());
    navigationButtonModel3 =
        createModel(context, () => NavigationButtonModel());
  }

  @override
  void dispose() {
    navigationButtonModel1.dispose();
    navigationButtonModel2.dispose();
    navigationButtonModel3.dispose();
  }
}
