class Event {
  final int id;
  final String name;
  final String organisation;
  final DateTime date;
  final String description;
  final String city;
  final String theme;
  final String image;

  Event({
    required this.date,
    required this.organisation,
    required this.city,
    required this.theme,
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      organisation: json['organisation'],
      date: json['date'],
      description: json['description'],
      city: json['city'],
      theme: json['theme'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'organisation': organisation,
        'date': date,
        'description': description,
        'city': city,
        'theme': theme,
        'image': image,
      };
}

final events = [
  Event(
    id: 1,
    name: 'Event 1',
    organisation: 'Organisation 1',
    date: DateTime.now(),
    description: 'Description 1',
    city: 'City 1',
    theme: 'Theme 1',
    image: 'assets/images/event1.jpg',
  ),
  Event(
    id: 2,
    name: 'Event 2',
    organisation: 'Organisation 2',
    date: DateTime.now(),
    description: 'Description 2',
    city: 'City 2',
    theme: 'Theme 2',
    image: 'assets/images/event2.jpg',
  ),
  Event(
    id: 3,
    name: 'Event 3',
    organisation: 'Organisation 3',
    date: DateTime.now(),
    description: 'Description 3',
    city: 'City 3',
    theme: 'Theme 3',
    image: 'assets/images/event3.jpg',
  ),
  Event(
    id: 4,
    name: 'Event 4',
    organisation: 'Organisation 4',
    date: DateTime.now(),
    description: 'Description 4',
    city: 'City 4',
    theme: 'Theme 4',
    image: 'assets/images/event4.jpg',
  ),
  Event(
    id: 5,
    name: 'Event 5',
    organisation: 'Organisation 5',
    date: DateTime.now(),
    description: 'Description 5',
    city: 'City 5',
    theme: 'Theme 5',
    image: 'assets/images/event5.jpg',
  ),
  Event(
    id: 6,
    name: 'Event 6',
    organisation: 'Organisation 6',
    date: DateTime.now(),
    description: 'Description 6',
    city: 'City 6',
    theme: 'Theme 6',
    image: 'assets/images/event6.jpg',
  ),
  Event(
    id: 7,
    name: 'Event 7',
    organisation: 'Organisation 7',
    date: DateTime.now(),
    description: 'Description 7',
    city: 'City 7',
    theme: 'Theme 7',
    image: 'assets/images/event7.jpg',
  ),
];
