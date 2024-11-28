import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'category_button_model.dart';
export 'category_button_model.dart';

class CategoryButtonWidget extends StatefulWidget {
  const CategoryButtonWidget({
    super.key,
    this.category,
    required this.icon,
  });

  final String? category;
  final Widget? icon;

  @override
  State<CategoryButtonWidget> createState() => _CategoryButtonWidgetState();
}

class _CategoryButtonWidgetState extends State<CategoryButtonWidget> {
  late CategoryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 48.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon!,
          Text(
            valueOrDefault<String>(
              widget.category,
              'comida',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
