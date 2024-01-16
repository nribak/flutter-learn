int calcFibonacci(int value) {
  switch(value) {
    case 0:
      return 0;
    case 1:
    case 2:
      return 1;
    default:
      return calcFibonacci(value - 1) + calcFibonacci(value - 2);
  }
}