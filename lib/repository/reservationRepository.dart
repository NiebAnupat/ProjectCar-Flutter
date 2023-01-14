import '../models/Reservation.dart';
import './provider/reservationProvider.dart';

class reservationRepository {
  static Future<List<Reservation>?> fetchAllReservation() =>
      reservationProvider.fetchReservation();
  static Future<Reservation?> createReservation(Reservation reservation) =>
      reservationProvider.addReservation(reservation);
}
