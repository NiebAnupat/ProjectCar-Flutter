import '../models/Reservation.dart';
import './provider/reservationProvider.dart';

class reservationRepository {
  Future<List<Reservation>?> fetchAllreservation() =>
      reservationProvider.fetchReservation();
  Future<List<Reservation>?> fetchreservationByCarId(String id) =>
      reservationProvider.fetchReservationByCarId(id);
  static Future<Reservation?> createReservation(Reservation reservation) =>
      reservationProvider.addReservation(reservation);
}
