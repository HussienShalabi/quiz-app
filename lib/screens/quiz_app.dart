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

  List correctAnswers = [
    'football ⚽',
    'black ⚫',
    'Cheetah 🐆',
    'Messi 🥇',
  ];

  List chosenAnswers = [];

  List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': 'What is the best sport ?',
      'answers': [
        'basketball 🏀',
        'football ⚽',
        'volleyball 🏐',
        'tennis 🎾',
      ],
    },
    {
      'question': 'What is the most beautiful color ?',
      'answers': [
        'red 🔴',
        'blue 🔵',
        'black ⚫',
        'green 🟢',
      ],
    },
    {
      'question': 'What is the fastest animal ?',
      'answers': [
        'horse 🐎',
        'turtle 🐢',
        'dog 🐕',
        'Cheetah 🐆',
      ],
    },
    {
      'question': 'Who is the best player? You\'re right, he is Messi',
      'answers': [
        'Messi 🥇',
        'Messi 🥇',
        'Messi 🥇',
        'Messi 🥇',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                              letterSpacing: 1)),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text('Answer and get points',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          )),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      for (int i = 0;
                          i < questionWithAnswer['answers'].length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                yourChoiceIndex = i;
                              });
                              print(yourChoiceIndex);
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
                                      Icons.add,
                                      color: i != yourChoiceIndex
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    SizedBox(
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
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // chosenAnswers.add(questionWithAnswer['answers'][i]);
                              print(chosenAnswers);
                              if (questionIndex < questionsWithAnswers.length - 1) {
                                questionIndex++;
                              } else {
                                for (int j = 0; j < chosenAnswers.length; j++) {
                                  if (chosenAnswers[j] == correctAnswers[j]) {
                                    result++;
                                  }
                                }
                                showResultsMessage = true;
                              }
                              yourChoiceIndex = null;
                            });
                          },
                          child: Text('Next'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                      ),
                      SizedBox(height: 20),

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
                                color: Colors.indigo.shade700)),
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
                            textStyle: TextStyle(
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
