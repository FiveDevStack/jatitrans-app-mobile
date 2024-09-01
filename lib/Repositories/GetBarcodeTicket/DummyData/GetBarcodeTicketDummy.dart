import 'package:jatitrans_app/Core/Utils/ImagesConstant.dart';

class GetBarcodeTicketDummy {
  var getBarcodeTickerDummy = {
    "status": {"code": 200, "message": "Success"},
    "data": {
      "stationName": "Halte Pondok Indah",
      "transportationName": "transjakarta",
      "price": "5000",
      "imageBarcode": ImagesConstant.qrCodeIcon,
      "status": "IN"
    }
  };
}
