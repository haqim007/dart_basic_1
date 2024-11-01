void loop() {
  for (int i = 0; i <= 100; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print("Remote Worker");
    }
    else if (i % 3 == 0) {
      print("Remote");
    }
    else if (i % 5 == 0) {
      print("Worker");
    }
    else{
      print(i);
    }
  }
}
