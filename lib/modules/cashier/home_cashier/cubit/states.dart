abstract class CashierHomeStates{}

class HomeInitialState extends CashierHomeStates{}

class ScanQrCodeSuccessState extends CashierHomeStates{}

class ScanQrCodeErrorState extends CashierHomeStates{}

class GetInvoiceInfoLoadingState extends CashierHomeStates{}

class GetInvoiceInfoSuccessState extends CashierHomeStates{}


class GetInvoiceInfoErrorState extends CashierHomeStates{
  final String error;
  GetInvoiceInfoErrorState(this.error);
}

