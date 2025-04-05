import 'dart:math';
// Add a property 'description' as string to the Style class

class Style {
  Style({this.style_id, required this.style_no, this.category, this.designer});

  int? style_id;
  String style_no;
  String? category;
  String? designer;
}

List<Style> generateRandomTestData() {
  final random = Random();
  const categories = ['Casual', 'Formal', 'Party', 'Sportswear', 'Ethnic'];
  const designers = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];

  return List.generate(20, (index) {
    return Style(
      style_id: index + 1,
      style_no: 'STY-${1000 + index}',
      category: random.nextBool()
          ? categories[random.nextInt(categories.length)]
          : null,
      designer: random.nextBool()
          ? designers[random.nextInt(designers.length)]
          : null,
    );
  });
}

List<Style> generateTestData() {
  return [
    Style(
        style_id: 1,
        style_no: 'STY-1001',
        category: 'Casual',
        designer: 'Alice'),
    Style(
        style_id: 2, style_no: 'STY-1002', category: 'Formal', designer: 'Bob'),
    Style(
        style_id: 3,
        style_no: 'STY-1003',
        category: 'Party',
        designer: 'Charlie'),
    Style(
        style_id: 4,
        style_no: 'STY-1004',
        category: 'Sportswear',
        designer: 'David'),
    Style(
        style_id: 5, style_no: 'STY-1005', category: 'Ethnic', designer: 'Eve'),
    Style(
        style_id: 6, style_no: 'STY-1006', category: 'Casual', designer: 'Bob'),
    Style(
        style_id: 7,
        style_no: 'STY-1007',
        category: 'Formal',
        designer: 'Alice'),
    Style(
        style_id: 8, style_no: 'STY-1008', category: 'Party', designer: 'Eve'),
    Style(
        style_id: 9,
        style_no: 'STY-1009',
        category: 'Sportswear',
        designer: 'Charlie'),
    Style(
        style_id: 10,
        style_no: 'STY-1010',
        category: 'Ethnic',
        designer: 'David'),
    Style(
        style_id: 11,
        style_no: 'STY-1011',
        category: 'Casual',
        designer: 'Eve'),
    Style(
        style_id: 12,
        style_no: 'STY-1012',
        category: 'Formal',
        designer: 'Charlie'),
    Style(
        style_id: 13,
        style_no: 'STY-1013',
        category: 'Party',
        designer: 'David'),
    Style(
        style_id: 14,
        style_no: 'STY-1014',
        category: 'Sportswear',
        designer: 'Bob'),
    Style(
        style_id: 15,
        style_no: 'STY-1015',
        category: 'Ethnic',
        designer: 'Alice'),
    Style(
        style_id: 16,
        style_no: 'STY-1016',
        category: 'Casual',
        designer: 'David'),
    Style(
        style_id: 17,
        style_no: 'STY-1017',
        category: 'Formal',
        designer: 'Eve'),
    Style(
        style_id: 18, style_no: 'STY-1018', category: 'Party', designer: 'Bob'),
    Style(
        style_id: 19,
        style_no: 'STY-1019',
        category: 'Sportswear',
        designer: 'Alice'),
    Style(
        style_id: 20,
        style_no: 'STY-1020',
        category: 'Ethnic',
        designer: 'Charlie'),
  ];
}
