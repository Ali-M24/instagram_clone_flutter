abstract class bnIndexEvent {}

class UpdateBNIndex extends bnIndexEvent {
  int newIndex;
  UpdateBNIndex(this.newIndex);
}
