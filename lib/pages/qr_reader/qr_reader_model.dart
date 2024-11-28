import '/backend/backend.dart';
import '/buttons/help_button/help_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'qr_reader_widget.dart' show QrReaderWidget;
import 'package:flutter/material.dart';

class QrReaderModel extends FlutterFlowModel<QrReaderWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for helpButton component.
  late HelpButtonModel helpButtonModel;
  var qrScanned = '';
  // Stores action output result for [Custom Action - splitStringBySemicolon] action in IconButton widget.
  List<String>? qrData;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  RestaurantsRecord? restaurantId;

  @override
  void initState(BuildContext context) {
    helpButtonModel = createModel(context, () => HelpButtonModel());
  }

  @override
  void dispose() {
    helpButtonModel.dispose();
  }
}
