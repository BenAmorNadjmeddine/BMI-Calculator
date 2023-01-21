import 'dart:math';

import 'package:bmi_calculator/Modules/AboutDeveloper/about_developer_ui.dart';
import 'package:bmi_calculator/Modules/BMICalculator/bmi_calculator_ui.dart';
import 'package:bmi_calculator/Modules/History/history_ui.dart';
import 'package:bmi_calculator/Modules/ResetData/reset_data_ui.dart';
import 'package:bmi_calculator/Modules/Settings/settings_ui.dart';
import 'package:bmi_calculator/Modules/ThemeMode/theme_mode_ui.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:bmi_calculator/Shared/Network/Local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const BMICalculatorUI(),
    const HistoryUI(),
    const SettingsUI(),
  ];

  List<String> title = [
    'BMI Calculator',
    'History',
    'Settings',
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: "BMI"),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavigationBarState());
  }

  bool isGenderChosen = false;
  bool? isMale;

  void changeGender(bool value) {
    isMale = value;
    emit(AppChangeGenderState());
  }

  double heightValue = 180.0;

  void changeHeightValue(double value) {
    heightValue = value;
    emit(AppChangeHeightValueState());
  }

  double weightValue = 80.0;

  void minusWeightValue() {
    if (weightValue > 1) {
      weightValue--;
      emit(AppChangeWeightValueState());
    }
  }

  void addWeightValue() {
    weightValue++;
    emit(AppChangeWeightValueState());
  }

  int ageValue = 25;

  void minusAgeValue() {
    if (ageValue > 2) {
      ageValue--;
      emit(AppChangeAgeValueState());
    }
  }

  void addAgeValue() {
    if (ageValue < 120) {
      ageValue++;
      emit(AppChangeAgeValueState());
    }
  }

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode({bool? isDarkFromShared}) {
    if (isDarkFromShared != null) {
      isDark = isDarkFromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBool(key: "isDark", value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  double? bmiResults;
  late IconData resultsSign;
  late String resultOfBMI;
  String? comment;

  void calculateBMI({
    required String gender,
    required int age,
    required double height,
    required double weight,
  }) {
    bmiResults = double.parse((weight / pow(height / 100, 2)).toStringAsFixed(2));
    if (ageValue <= 20) {
      if (bmiResults! <= 19) {
        resultOfBMI = "Underweight";
        comment = "You are underweight!\nMaybe you should start eating food!";
      } else if (bmiResults! > 19 && bmiResults! <= 27.1) {
        resultOfBMI = "Healthy Weight";
        comment = "You have a Healthy Weight!\nKeep it up!";
      } else if (bmiResults! > 27.1 && bmiResults! <= 31) {
        resultOfBMI = "At Risk of Being Overweight";
        comment = "You are At Risk of Being Overweight!\nSlow down a little bit!";
      } else {
        resultOfBMI = "Overweight";
        comment = "You are Overweight!\n You should start working on diets!";
      }
    } else {
      if (bmiResults! < 18.5) {
        resultOfBMI = "Underweight";
        comment = "You are underweight!\nMaybe you should start eating food!";
      } else if (bmiResults! >= 18.5 && bmiResults! < 25) {
        resultOfBMI = "Healthy Weight";
        comment = "You have a Healthy Weight!\nKeep it up!";
      } else if (bmiResults! >= 25 && bmiResults! < 30) {
        resultOfBMI = "Overweight";
        comment = "You are Overweight!\n You should start working on diets!";
      } else {
        resultOfBMI = "Obese";
        comment = "You have Obese!\n Stop doing this to yourself and start working on your health before it gets late!";
      }
    }
  }

  late Database database;

  void createDataBase() {
    openDatabase("bmi.db", version: 1, onCreate: (database, version) async {
      await database
          .execute(""
              "CREATE TABLE results ("
              "id INTEGER PRIMARY KEY, "
              "name TEXT, "
              "gender TEXT, "
              "date TEXT, "
              "time TEXT, "
              "age REAL, "
              "height REAL, "
              "weight REAL, "
              "bmi REAL, "
              "result_of_bmi TEXT, "
              "comment TEXT"
              ")")
          .then((value) {})
          .catchError((error) {
        showToast(
          text: 'Error: ${error.toString()}',
          state: ToastStates.error,
        );
      });
    }, onOpen: (database) {
      getDataFromDataBase(database);
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  List<Map> resultsHistory = [];

  void getDataFromDataBase(database) {
    resultsHistory.clear();
    emit(AppGetFromDatabaseState());
    database.rawQuery("SELECT * FROM results").then((value) {
      value.forEach((element) {
        resultsHistory.add(element);
      });
      resultsHistory = resultsHistory.reversed.toList();
      emit(AppGetFromDatabaseState());
    });
  }

  void insertIntoDataBase({
    BuildContext? context,
    required String name,
    required String gender,
    required String date,
    required String time,
    required int age,
    required double height,
    required double weight,
    required double bmi,
    required String resultOfBMI,
    required String comment,
  }) async {
    await database
        .transaction((txn) => txn
                .rawInsert(""
                    "INSERT INTO results (name, gender, date, time, age, height, weight, bmi, result_of_bmi, comment) "
                    "VALUES ('$name','$gender', '$date', '$time', '$age', '$height', '$weight', '$bmi', '$resultOfBMI', '$comment')"
                    "")
                .then((value) {
              showToast(
                text: "Results saved successfully",
                state: ToastStates.success,
              );
              Navigator.pop(context!);
              emit(AppInsertIntoDatabaseState());
              getDataFromDataBase(database);
            }).catchError((error) {
              showToast(
                text: 'Error: ${error.toString()}',
                state: ToastStates.error,
              );
            }))
        .catchError((error) {
      showToast(
        text: 'Error: ${error.toString()}',
        state: ToastStates.error,
      );
    });
  }

  void deleteFromDataBase({required int id}) {
    database.rawDelete(
      "DELETE FROM results WHERE id = ?",
      [id],
    ).then((value) {
      showToast(
        text: "Results deleted successfully",
        state: ToastStates.error,
      );
      getDataFromDataBase(database);
      emit(AppDeleteFromDatabaseState());
    });
  }

  void restartCalculation(context) {
    isGenderChosen = false;
    ageValue = 25;
    heightValue = 180.0;
    weightValue = 80.0;
    Navigator.pop(context);
    emit(AppRestartCalculationState());
  }

  void resetAppData(context) {
    database.rawDelete("DELETE FROM results").then((value) {
      showToast(
        text: "All data has been reset successfully",
        state: ToastStates.success,
      );
      createDataBase();
      Navigator.pop(context);
      isDark = false;
      CacheHelper.putBool(key: "isDark", value: isDark).then((value) {
        emit(AppChangeModeState());
      });
      resultsHistory.clear();
      currentIndex = 0;
      isGenderChosen = false;
      ageValue = 25;
      heightValue = 180.0;
      weightValue = 80.0;
      emit(AppDeleteAllDatabaseState());
    });
  }

  List<Widget> settingsScreens = [
    const ThemeModeUI(),
    const ResetDataUI(),
    const AboutDeveloperUI(),
  ];

  List<IconData> settingsIcons = [
    Icons.settings,
    Icons.delete_forever,
    Icons.info_outline,
  ];

  List<String> settingsTitles = [
    "Theme Mode",
    "Reset Data",
    "About Developer",
  ];

  List<String> settingsSubtitles = [
    "Change theme mode",
    "Erase all data and bring back the default settings",
    "Get to know the app developer",
  ];

  String email = Uri.encodeComponent("nadjmeddinebenamor@gmail.com");
  String emailSubject = Uri.encodeComponent("Hello Nadjmeddine...");

  void lunchEmail() async {
    Uri mail = Uri.parse("mailto:$email?subject=$emailSubject");
    await launchUrl(mail).then((value) {}).catchError((error) {
      showToast(
        text: 'Could not launch $mail\n${error.toString()}',
        state: ToastStates.error,
      );
    });
  }

  void launchWhatsApp(context) async {
    await launchUrl(
      Uri.parse("https://wa.me/?text=Hello Nadjmeddine..."),
      mode: LaunchMode.externalApplication,
    ).then((value) {}).catchError((error) {
      showToast(
        text: 'Could not launch ${Uri.parse("https://wa.me/?text=Hello Nadjmeddine...")}\n${error.toString()}',
        state: ToastStates.error,
      );
    });
  }

  void launchLinkedIn(context) async {
    await launchUrl(
      Uri.parse("https://www.linkedin.com/in/nadjmeddine-ben-amor/"),
      mode: LaunchMode.externalApplication,
    ).then((value) {}).catchError((error) {
      showToast(
        text: 'Could not launch ${Uri.parse("https://www.linkedin.com/in/nadjmeddine-ben-amor/")}\n${error.toString()}',
        state: ToastStates.error,
      );
    });
  }

  void launchGitHub(context) async {
    await launchUrl(
      Uri.parse("https://github.com/BenAmorNadjmeddine"),
      mode: LaunchMode.externalApplication,
    ).then((value) {}).catchError((error) {
      showToast(
        text: 'Could not launch ${Uri.parse("https://github.com/BenAmorNadjmeddine")}\n${error.toString()}',
        state: ToastStates.error,
      );
    });
  }
}
