void main() {
  var sum = 1;
  while (sum < 10) {
    sum += 4;
    print(sum);
  }

  sum = 1;
  while (true) {
    sum += 4;
    if (sum > 10) {
      break;
    }
  }

  for (var i = 0; i < 5; i++) {
    print(i);
  }
}
