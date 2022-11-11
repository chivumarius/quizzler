// ♦♦ The "Question" Class:
class Question {
  // Property Declaration:
  late String questionText;
  late bool questionAnswer;

  // ♦ The "Syntactic Sugar Constructor"
  //    → for "Initializing Properties"
  //    → with the "this" Keyword:
  Question(this.questionText, this.questionAnswer);

  // Question({required String q, required bool a}) {
  //   // Property Initialization
  //   questionText = q;
  //   bool questionAnswer = a;
  // }
}
