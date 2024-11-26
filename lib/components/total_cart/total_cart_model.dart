import '/buttons/green_button/green_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'total_cart_widget.dart' show TotalCartWidget;
import 'package:flutter/material.dart';

class TotalCartModel extends FlutterFlowModel<TotalCartWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for greenButton component.
  late GreenButtonModel greenButtonModel;

  @override
  void initState(BuildContext context) {
    greenButtonModel = createModel(context, () => GreenButtonModel());
  }

  @override
  void dispose() {
    greenButtonModel.dispose();
  }
}
