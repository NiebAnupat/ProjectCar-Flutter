import 'package:gsheets/gsheets.dart';

class googleSheetProvider {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "project-car-374115",
  "private_key_id": "ee80e9456b977e2b68095108a16399a5f0021df8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCtq/+H3UmgyesG\nDm9AtXHLyTpLwBjLLWQmtiX+y3Md8fmPU+WFvxjFejO9Dikf/FqCTagacf4fnHre\nzSgO+tLYgmbrPvymE+bfAJ8rr8HoXdWZWX/PcbxVsvYMeU0JTrUBGtEWNTXJwwny\n+v4/ymWks8KNkMD5p9Y6MJlzhNpe1KbGOBFHA2S4XqCuOwIPn6UofqjFKoyCRIqg\nuNXvFlOSeNbbBfz6GjSK4b1sW9Q5fPEanen908znklrLj4RbMkGzEnouw56QcOt6\nHYs4uPkqCprYsmL5I5FWOrTZdrMy5yTmuY++UJVCYatFHRFBsAR+X/SIrUdPZyE4\nlrR+MQfDAgMBAAECggEAAZ+EZVwrln2cnTNgVc38UMfCLDgQ40E62OPF6iIzormC\nuBS0JfJZxGq2dhNeTga5P9OC+TBMjDYVreRj9fPhKZXaaWNu0AyKkVX7pthfKxFJ\ncEP2XlV1SaXBB+/QSQB7z5VVE+yOYqLYgnVXD/iPx6DIdjM+onavmV6f6IT6130I\nWvIfvU5NDma6Z1tfgcAPLtv7zoz1WUY/uwhFK2VapPKrdWCrDkErgCq/uudt4fDV\nXhZCKUHc8/16kup0F/YUcih4+q3UppKUblzicKLJjxnK4ZMWplI4LHfp88dkaRib\nBnRojdQ7n4RXXh26aLgEz8KztP/j9sY1saA8uIrVYQKBgQDVSEZbFxlDuHMeD2kH\nq8VvUe7OrG9hC/5p+s3E2mNYDF9rzWqn1/mHHiQtkxH+OrGKN5lPnNaWJoajzRGY\nFa6qRDQYA1McIPkqKkE3LuSGY484L3ba25vS+GR1RRm6lJJ4umzKMwwJW+hhfHhN\nhwcYWMiPrCv/8K/rBB+/LxXWowKBgQDQdMH8pIIdXMwJKu4JzZGDZ1CrsFbm0cQj\n384kp8+YjN1FasI7CwusPTKiLNBMioL3Uy/3k8LSFlaAtBVt3+CgUdrF/6Ib3evy\nPLYq3GLkFsrOIdOTOqITwrzJN26nv41BW/mYGKCEe0g560tPjwNl3Xzd/Dqor4Sm\n6eNGETm8YQKBgHYazrL0aI4insSfnfacfPk28rnJrOedn6WKN9XxZR/FwjVNC+mj\n5E6ZN0lxbn5MfDHgtenrHL0K2nXsQfjo0M8Cc6J0fNpPvApIWdK4Cd4NVaq0RenN\nwE0kNWTm/edfDHkEKugROnIYTedl6KxtwFUQHQfKPJc+7fuDTh0tcrdnAoGBAMGD\nUj4d3agyaDsufjHdgvMQawQnPFUkcEe5UR4YJpCAXD0/4TV8iIaJfUKuBWS4xOGi\neQoFQrtS/1SVWLtaNKW/ty9No4jpGEsU7yuU0bzaJ8T6A/ZOXP2pLyZAbloNaa0+\nG9OFMSYraB5UfuJJaicbWPqeVzoXTjbBMzntbcKhAoGAOs0cXjb61YepNsRl+U7D\ncQVhHqyI0I7wmkzmhLkK0M8lU+qr5aEU/ZniWBiGlW5MIDX+82YZXGh5XvOITSpN\nXjyVcJmYTIYwWo1IYYMg//+xXJmEtI9VaGdJW0WTiC3491xBaCKmUBDOZKxYmm3c\nVcOnBlUuiMePd7EmWDYw7O4=\n-----END PRIVATE KEY-----\n",
  "client_email": "project-car@project-car-374115.iam.gserviceaccount.com",
  "client_id": "117675429595792856662",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/project-car%40project-car-374115.iam.gserviceaccount.com"
}
''';

  static const _spreadsheetId = "1JvvFGVEY4tKccB7d-irRN77VMaIodfB92nqNFLh8vDQ";
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _employeeSheet;
  static Worksheet? _carSheet;
  static Worksheet? _reservationSheet;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _employeeSheet = spreadsheet.worksheetByTitle('employee');
    _carSheet = spreadsheet.worksheetByTitle('car');
  }

  static Future<Worksheet> get employeeSheet async {
    if (_employeeSheet == null) {
      await init();
    }
    return _employeeSheet!;
  }

  static Future<Worksheet> get carSheet async {
    if (_carSheet == null) {
      await init();
    }
    return _carSheet!;
  }

  static Future<Worksheet> get reservationSheet async {
    if (_reservationSheet == null) {
      await init();
    }
    return _reservationSheet!;
  }
}
