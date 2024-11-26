import '/backend/backend.dart';
import '/buttons/help_button/help_button_widget.dart';
import '/components/history_item/history_item_widget.dart';
import '/components/navigation_bar_bottom/navigation_bar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for helpButton component.
  late HelpButtonModel helpButtonModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<HistoryRecord> simpleSearchResults = [];
  // Models for historyItem dynamic component.
  late FlutterFlowDynamicModels<HistoryItemModel> historyItemModels;
  // Model for navigationBarBottom component.
  late NavigationBarBottomModel navigationBarBottomModel;

  @override
  void initState(BuildContext context) {
    helpButtonModel = createModel(context, () => HelpButtonModel());
    historyItemModels = FlutterFlowDynamicModels(() => HistoryItemModel());
    navigationBarBottomModel =
        createModel(context, () => NavigationBarBottomModel());
  }

  @override
  void dispose() {
    helpButtonModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    historyItemModels.dispose();
    navigationBarBottomModel.dispose();
  }
}
