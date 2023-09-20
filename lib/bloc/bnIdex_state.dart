abstract class bnIndexState {}

class bnIndexInitial extends bnIndexState {
  int currentIndex;
  bnIndexInitial(this.currentIndex);
}

class bnIndex extends bnIndexState {
  int index;
  bnIndex(this.index);
}
