import '/buttons/green_button/green_button_widget.dart';
import '/buttons/help_button/help_button_widget.dart';
import '/buttons/white_button/white_button_widget.dart';
import '/components/navigation_bar_bottom/navigation_bar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_restaurant_qr_widget.dart' show ConfirmRestaurantQrWidget;
import 'package:flutter/material.dart';

class ConfirmRestaurantQrModel
    extends FlutterFlowModel<ConfirmRestaurantQrWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for helpButton component.
  late HelpButtonModel helpButtonModel;
  // Model for greenButton component.
  late GreenButtonModel greenButtonModel;
  // Model for whiteButton component.
  late WhiteButtonModel whiteButtonModel;
  // Model for navigationBarBottom component.
  late NavigationBarBottomModel navigationBarBottomModel;

  @override
  void initState(BuildContext context) {
    helpButtonModel = createModel(context, () => HelpButtonModel());
    greenButtonModel = createModel(context, () => GreenButtonModel());
    whiteButtonModel = createModel(context, () => WhiteButtonModel());
    navigationBarBottomModel =
        createModel(context, () => NavigationBarBottomModel());
  }

  @override
  void dispose() {
    helpButtonModel.dispose();
    greenButtonModel.dispose();
    whiteButtonModel.dispose();
    navigationBarBottomModel.dispose();
  }
}
