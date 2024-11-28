import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/buttons/help_button/help_button_widget.dart';
import '/components/empty_history/empty_history_widget.dart';
import '/components/history_item/history_item_widget.dart';
import '/components/navigation_bar_bottom/navigation_bar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:text_search/text_search.dart';
import 'history_model.dart';
export 'history_model.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget>
    with TickerProviderStateMixin {
  late HistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<HistoryRecord>>(
      stream: queryHistoryRecord(
        queryBuilder: (historyRecord) => historyRecord.where(
          'user',
          isEqualTo: currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<HistoryRecord> historyHistoryRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 350.0,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.helpButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const HelpButtonWidget(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Historial',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: 350.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                const Duration(milliseconds: 0),
                                () async {
                                  safeSetState(() {
                                    _model.simpleSearchResults = TextSearch(
                                      historyHistoryRecordList
                                          .map(
                                            (record) =>
                                                TextSearchItem.fromTerms(record,
                                                    [record.restaurantName]),
                                          )
                                          .toList(),
                                    )
                                        .search(_model.textController.text)
                                        .map((r) => r.object)
                                        .toList();
                                  });
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Buscar',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
                      Container(
                        width: 350.0,
                        height: 500.0,
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final history =
                                (_model.textController.text != ''
                                        ? _model.simpleSearchResults
                                            .map((e) => e)
                                            .toList()
                                        : historyHistoryRecordList
                                            .map((e) => e)
                                            .toList())
                                    .toList();
                            if (history.isEmpty) {
                              return const Center(
                                child: EmptyHistoryWidget(),
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: history.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder: (context, historyIndex) {
                                final historyItem = history[historyIndex];
                                return wrapWithModel(
                                  model: _model.historyItemModels.getModel(
                                    historyItem.reference.id,
                                    historyIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: HistoryItemWidget(
                                    key: Key(
                                      'Keyti3_${historyItem.reference.id}',
                                    ),
                                    restaurantName: historyItem.restaurantName,
                                    amount: historyItem.amount,
                                    date: historyItem.date!,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.navigationBarBottomModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavigationBarBottomWidget(
                          width: 350.0,
                          homeState: Icon(
                            FFIcons.ktypeHomeStateDefault,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          cartState: Icon(
                            Icons.shopping_cart_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          historyState: Icon(
                            FFIcons.ktypeHistoryStateFill,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
