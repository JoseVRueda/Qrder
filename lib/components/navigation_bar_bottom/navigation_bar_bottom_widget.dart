import '/buttons/navigation_button/navigation_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'navigation_bar_bottom_model.dart';
export 'navigation_bar_bottom_model.dart';

class NavigationBarBottomWidget extends StatefulWidget {
  const NavigationBarBottomWidget({
    super.key,
    this.width,
    required this.homeState,
    required this.cartState,
    required this.historyState,
  });

  final double? width;
  final Widget? homeState;
  final Widget? cartState;
  final Widget? historyState;

  @override
  State<NavigationBarBottomWidget> createState() =>
      _NavigationBarBottomWidgetState();
}

class _NavigationBarBottomWidgetState extends State<NavigationBarBottomWidget> {
  late NavigationBarBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationBarBottomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              -2.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('home');
            },
            child: wrapWithModel(
              model: _model.navigationButtonModel1,
              updateCallback: () => safeSetState(() {}),
              child: NavigationButtonWidget(
                icon: widget.homeState!,
                text: 'Inicio',
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'shoppingCart',
                queryParameters: {
                  'restaurantName': serializeParam(
                    '',
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            },
            child: wrapWithModel(
              model: _model.navigationButtonModel2,
              updateCallback: () => safeSetState(() {}),
              child: NavigationButtonWidget(
                icon: widget.cartState!,
                text: 'Carrito',
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('history');
            },
            child: wrapWithModel(
              model: _model.navigationButtonModel3,
              updateCallback: () => safeSetState(() {}),
              child: NavigationButtonWidget(
                icon: widget.historyState!,
                text: 'Historial',
              ),
            ),
          ),
        ].divide(const SizedBox(width: 10.0)),
      ),
    );
  }
}
