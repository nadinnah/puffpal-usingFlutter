class QuestionNode{
  final String question;
  final Map<String, dynamic> answers;

  QuestionNode(this.question, this.answers);
}

//final QuestionNode asthmaTree = QuestionNode(
//   "Do you have trouble breathing?",
//   {
//     "Yes": QuestionNode("Do you use an inhaler regularly?", {
//       "Yes": "Continue your current treatment.",
//       "No": "Consult your doctor about inhaler use."
//     }),
//     "No": "You’re doing fine! Keep monitoring your health.",
//   },
// );
//
// final QuestionNode asthmaTree = QuestionNode(
//   "Have you experienced shortness of breath recently?",
//     {
//       "Yes": QuestionNode(
//
//       ),
//       "No": QuestionNode(),
//     }
// );
//
// (have you experienced shortness of breath recently?)
//   (if yes: how often?)
//     (if daily or 4-6 times a week or 1-3 times a week: does shortness of breath limit your daily activity?)
//       (if yes:)
//       (if no:have you experienced coughing especially at night/early morning?)
//         (if yes or no:have you experienced wheezing?)
//           (if yes or no: do asthma symptoms disrupt your sleep?)
//             (if yes:)
//             (if no:)
//     (if rarely: do you use a rescue inhaler when you feel short of breath?)
//       (if yes:)
//       (if no:)
//   (if no:)