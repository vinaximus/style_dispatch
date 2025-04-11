Future<String> getUserData() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
  return 'User data fetched';
}

void main() async {
  String userData = await getUserData(); // Fetch user data asynchronously
  print(userData); // Print the fetched user data
}
