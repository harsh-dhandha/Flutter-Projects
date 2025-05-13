class Test {
  void add() {
    Map<String, dynamic> mapdata = {"Id": 1, "Name": "John Doe"};
    Map<String, dynamic> mapno = {"School": " Acadamy", "Roll No.": 1};
    mapdata.addAll(mapno);
    print(mapdata);
  }

  void main() {
    Test obj = Test();
    obj.add();
  }
}
