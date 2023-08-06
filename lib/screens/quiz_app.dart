import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showResultsMessage = false;
  int questionIndex = 0;
  int? yourChoiceIndex;

  int result = 0;
  List chosenIndex = [];

  List correctAnswers = [
    'football',
    'black',
    'plane',
    'Messi',
  ];

  List chosenAnswers = [];

  List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': "What is the best sport ?",
      'answers': [
        'football',
        'volleyball',
        'basketball',
        'tennis',
      ],
      'Icons' : [
        Icons.sports_soccer,
        Icons.sports_volleyball,
        Icons.sports_basketball,
        Icons.sports_tennis,

      ],
    },
    {
      'question': 'What is the most beautiful color ?',
      'answers': [
        'red',
        'blue',
        'black',
        'green',
      ],
      'Icons' : [
        Icons.color_lens,
        Icons.color_lens_outlined,
        Icons.colorize_sharp,
        Icons.format_color_fill,

      ],
    },
    {
      'question': 'What is the fastest travel way ?',
      'answers': [
        'plane',
        'car',
        'bus',
        'boat',
      ],
      'Icons' : [
         Icons.airplanemode_on,
         Icons.directions_car,
         Icons.directions_bus,
         Icons.directions_boat,

      ],
    },
    {
      'question': 'Who is the best player? You\'re right, he is Messi',
      'answers': [
        'Messi',
        'Messi',
        'Messi',
        'Messi',
      ],
      'Icons' : [
        Icons.looks_one,
        Icons.looks_one,
        Icons.looks_one,
        Icons.looks_one,

      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    // final progress = questionIndex;
    final questionWithAnswer = questionsWithAnswers[questionIndex];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: showResultsMessage == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Text(questionWithAnswer['question'],
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              // letterSpacing: 1
                          )),

                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text('Answer and get points',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          )),
                      SizedBox(
                        height: size.height * 0.1,
                      ),

                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Step ${questionIndex + 1}',
                              style:
                                  const TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const TextSpan(
                              text: ' of 4',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      LinearProgressIndicator(
                        value: questionIndex.toDouble() / 4,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      for (int i = 0; i < questionWithAnswer['answers'].length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                yourChoiceIndex = i;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: i != yourChoiceIndex
                                      ? Colors.white
                                      : Colors.green,
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Icon(
                                      questionWithAnswer['Icons'][i],
                                      color: i != yourChoiceIndex
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      questionWithAnswer['answers'][i],
                                      style: TextStyle(
                                          color: i != yourChoiceIndex
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // chosenAnswers.add(questionWithAnswer['answers'][yourChoiceIndex]);
                              if (yourChoiceIndex != null) {
                                chosenAnswers.add(questionWithAnswer['answers']
                                    [yourChoiceIndex]);
                                if (questionIndex <
                                    questionsWithAnswers.length - 1) {
                                  questionIndex++;
                                } else {
                                  for (int j = 0;
                                      j < chosenAnswers.length;
                                      j++) {
                                    if (chosenAnswers[j] == correctAnswers[j]) {
                                      result++;
                                    }
                                  }
                                  showResultsMessage = true;
                                }
                                yourChoiceIndex = null;
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Choose an answer first'),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ));
                              }
                            });
                          },
                          child: const Text('Next'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // for (int i = 0; i < questionWithAnswer['answers'].length; i++)
                      //   Padding(
                      //     padding: const EdgeInsets.only(bottom: 15.0),
                      //     child: SizedBox(
                      //       width: double.infinity,
                      //       height: 40,
                      //       child: ElevatedButton(
                      //           style: ButtonStyle(
                      //             shape: MaterialStatePropertyAll(
                      //               RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(15),
                      //               ),
                      //             ),
                      //             backgroundColor: MaterialStatePropertyAll(Colors.indigo),
                      //           ),
                      //           onPressed: () {
                      //             setState(() {
                      //               chosenAnswers
                      //                   .add(questionWithAnswer['answers'][i]);
                      //               print(chosenAnswers);
                      //
                      //               if (questionIndex <
                      //                   questionsWithAnswers.length - 1) {
                      //                 questionIndex++;
                      //               } else {
                      //                 for (int j = 0;
                      //                     j < chosenAnswers.length;
                      //                     j++) {
                      //                   if (chosenAnswers[j] ==
                      //                       correctAnswers[j]) {
                      //                     result++;
                      //                   }
                      //                 }
                      //                 showResultsMessage = true;
                      //               }
                      //             });
                      //           },
                      //           child: Text(
                      //             questionWithAnswer['answers'][i],
                      //             style: const TextStyle(fontSize: 18),
                      //           )),
                      //     ),
                      //   ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Congratulations!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.green.shade900)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Your score is: $result/${questionsWithAnswers.length}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              questionIndex = 0;
                              showResultsMessage = false;
                              result = 0;
                              chosenAnswers.clear();
                            });
                          },
                          child: const Text(
                            'Reset quiz',
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                            textStyle: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
      ),
    );
  }
}
