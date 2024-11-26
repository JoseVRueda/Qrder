import '/buttons/green_button/green_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'total_bill_widget.dart' show TotalBillWidget;
import 'package:flutter/material.dart';

class TotalBillModel extends FlutterFlowModel<TotalBillWidget> {
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
