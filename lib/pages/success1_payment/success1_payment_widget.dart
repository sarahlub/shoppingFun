import '/components/success_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'success1_payment_model.dart';
export 'success1_payment_model.dart';

class Success1PaymentWidget extends StatefulWidget {
  const Success1PaymentWidget({super.key});

  @override
  _Success1PaymentWidgetState createState() => _Success1PaymentWidgetState();
}

class _Success1PaymentWidgetState extends State<Success1PaymentWidget> {
  late Success1PaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Success1PaymentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: wrapWithModel(
          model: _model.successModel,
          updateCallback: () => setState(() {}),
          child: const SuccessWidget(),
        ),
      ),
    );
  }
}
