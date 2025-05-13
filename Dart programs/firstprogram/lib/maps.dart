class Test {
  add() {
    Map<dynamic, String> mapdata = {1: "one", 2: "two", "Name": "Harsh:"};

    mapdata["School"] = "ABC";
    print(mapdata.keys);
    print(mapdata.values);
    print(mapdata.isNotEmpty);
    Map<dynamic, String> mapadd = {"Name": "Harsh", "Age": "20"};
    mapdata.addAll(mapadd);
    print(mapdata);
  }
}

void main() {
  Test obj = Test();
  obj.add();
}
