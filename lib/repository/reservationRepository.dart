import '../models/Reservation.dart';
import './provider/reservationProvider.dart';

class reservationRepository {
  Future<List<Reservation>?> fetchAllreservation() =>
      reservationProvider.fetchReservation();
  Future<List<Reservation>?> fetchreservationByCarId(String id) =>
      reservationProvider.fetchReservationByCarId(id);
  Future<Reservation?> addreservation(Reservation reservation) =>
      reservationProvider.addreservation(reservation);
}
