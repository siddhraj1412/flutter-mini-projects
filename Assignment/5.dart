import 'dart:async';

int availableSeats = 3;


Future<bool> checkSeatAvailability(int seatsRequested) {
  print("\nChecking seat availability...");
  
  return Future.delayed(const Duration(seconds: 2), () {
    if (availableSeats >= seatsRequested) {
      print("Seats are available.");
      return true;
    } else {
      print("Sorry, not enough seats are available.");
      return false;
    }
  });
}


Future<String> confirmBooking(int seatsRequested) {
  print("Confirming your booking...");

  return Future.delayed(const Duration(seconds: 1), () {
    availableSeats -= seatsRequested;
    return "Booking Confirmed";
  });
}

Future<void> bookTickets(String user, int seatsToBook) async {
  print("--- ${user} started booking ${seatsToBook} seat(s) ---");
  
  try {
    String result = await Future(() async {
      bool areSeatsAvailable = await checkSeatAvailability(seatsToBook);

      if (areSeatsAvailable) {
        return await confirmBooking(seatsToBook);
      } else {
        throw Exception("Booking Failed: Not enough seats.");
      }
    }).timeout(const Duration(seconds: 4));

    print(" SUCCESS: $result for ${user}.");

  } on TimeoutException {
    print("FAILED: The booking process for ${user} timed out.");
  } catch (e) {
    print(" FAILED: ${e.toString().replaceFirst('Exception: ', '')}");
  } finally {
    print("--- ${user}'s booking attempt finished ---\n");
  }
}

void main() async {
  await bookTickets("Om", 2);

  await bookTickets("Hari", 2);
  
  await bookTickets("Sans", 1);
}
