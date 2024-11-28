import '/components/help/help_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'help_button_model.dart';
export 'help_button_model.dart';

class HelpButtonWidget extends StatefulWidget {
  const HelpButtonWidget({super.key});

  @override
  State<HelpButtonWidget> createState() => _HelpButtonWidgetState();
}

class _HelpButtonWidgetState extends State<HelpButtonWidget>
    with TickerProviderStateMixin {
  late HelpButtonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpButtonModel());

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-55.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => FlutterFlowIconButton(
        borderColor: Colors.transparent,
        buttonSize: 50.0,
        icon: Icon(
          Icons.help_outline_rounded,
          color: FlutterFlowTheme.of(context).primary,
          size: 32.0,
        ),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 1.0)
                    .resolve(Directionality.of(context)),
                child: const SizedBox(
                  height: 400.0,
                  width: double.infinity,
                  child: HelpWidget(),
                ),
              );
            },
          );
        },
      ).animateOnPageLoad(animationsMap['iconButtonOnPageLoadAnimation']!),
    );
  }
}
