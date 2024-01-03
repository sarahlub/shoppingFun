import '/components/success_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'success1_payment_widget.dart' show Success1PaymentWidget;
import 'package:flutter/material.dart';

class Success1PaymentModel extends FlutterFlowModel<Success1PaymentWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for success component.
  late SuccessModel successModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    successModel = createModel(context, () => SuccessModel());
  }

  @override
  void dispose() {
    successModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
