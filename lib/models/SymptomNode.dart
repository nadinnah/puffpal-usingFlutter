abstract class SymptomNode {}

class QuestionNode extends SymptomNode {
  final String question;
  final Map<String, SymptomNode> options;

  QuestionNode(this.question, this.options);
}

class ResultNode extends SymptomNode {
  final String result;
  ResultNode(this.result);
}

final SymptomNode asthmaTree = QuestionNode(
  "Have you experienced shortness of breath recently?",
  {
    "Yes": QuestionNode(
      "How often?",
      {
        "Daily": QuestionNode("Does it limit your daily activity?", {
          "Yes": ResultNode("Please consult your doctor immediately."),
          "No": QuestionNode("Coughing at night/early morning?", {
            "Yes": ResultNode("Consider tracking night symptoms."),
            "No": ResultNode("Continue monitoring."),
          }),
        }),
        "Rarely": QuestionNode("Do you use a rescue inhaler?", {
          "Yes": ResultNode("Ensure your inhaler is not expired."),
          "No": ResultNode("Discuss rescue options with your doctor."),
        }),
      },
    ),
    "No": ResultNode("You're doing great! Keep it up."),
  },
);