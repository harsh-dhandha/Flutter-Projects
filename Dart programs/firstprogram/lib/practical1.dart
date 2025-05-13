import 'dart:io';

void main() {
  const int adultage = 18;
  const int seniorage = 65;

  stdout.write('Please enter your name: ');
  String name = stdin.readLineSync() ?? '';

  int age;
  do {
    stdout.write('Please enter your age: ');
    try {
      age = int.parse(stdin.readLineSync() ?? '0');
      if (age < 0 || age > 120) {
        print('Please enter a valid age between 0 and 120.');
        continue;
      }
      break;
    } catch (e) {
      print('Please enter a valid number.');
    }
  } while (true);

  stdout.write('Please enter your favourite colour: ');
  String favouriteColor = stdin.readLineSync() ?? '';

  String ageCategory = '';
  if (age < adultage) {
    ageCategory = 'Youth';
  } else if (age < seniorage) {
    ageCategory = 'Adult';
  } else {
    ageCategory = 'Senior';
  }

  List<String> userInfo = [name, age.toString(), favouriteColor];

  Set<String> characteristics = {
    ageCategory,
    favouriteColor,
    age % 2 == 0 ? 'Even Age' : 'Odd Age'
  };

  Map<String, dynamic> userProfile = {
    'name': name,
    'age': age,
    'favouriteColor': favouriteColor,
    'ageCategory': ageCategory
  };

  print('\n--- User Profile Summary ---');
  print('Name: ${userProfile['name']}');
  print('Age: ${userProfile['age']}');
  print('Favourite Color: ${userProfile['favouriteColor']}');

  print('\n--- Age ---');
  if (age < adultage) {
    print(
        'Hello $name! You have so many exciting years ahead to explore and learn!');
  } else if (age < seniorage) {
    print(
        'Welcome $name! Your prime years are perfect for achieving your goals!');
  } else {
    print('Greetings $name! Your wisdom and experience are valuable assets!');
  }

  print('\n--- Collection Details ---');
  print('List of user information: $userInfo');
  print('Set of characteristics: $characteristics');
  print('Map of user profile: $userProfile');
}
