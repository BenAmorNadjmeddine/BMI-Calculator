abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavigationBarState extends AppStates {}

class AppChangeGenderState extends AppStates {}
class AppChangeHeightValueState extends AppStates {}
class AppChangeWeightValueState extends AppStates {}
class AppChangeAgeValueState extends AppStates {}

class AppChangeModeState extends AppStates {}
class AppRestartCalculationState extends AppStates {}

class AppCreateDatabaseState extends AppStates {}
class AppGetFromDatabaseState extends AppStates {}
class AppInsertIntoDatabaseState extends AppStates {}
class AppDeleteFromDatabaseState extends AppStates {}
class AppDeleteAllDatabaseState extends AppStates {}