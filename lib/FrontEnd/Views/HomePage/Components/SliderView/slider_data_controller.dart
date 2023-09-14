import '../../../../../DataBase/Controllers/events_controller.dart';
import '../../../../../DataBase/Models/events.dart';

class SliderDataController {
  Future<List<Event>> get getData async {
    List<Event> events = [];
    EventsController.getEventsList().then((value) => events = value);
    return events;
  }
}

String image1 =
    'https://images.pexels.com/photos/7065187/pexels-photo-7065187.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
String image2 =
    'https://images.pexels.com/photos/4202952/pexels-photo-4202952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
String image3 =
    'https://images.pexels.com/photos/6941028/pexels-photo-6941028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
String sourceUrl = 'pexels.com';
