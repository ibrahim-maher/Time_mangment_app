class BookState {
  BookState init() {
    return BookState();
  }

  BookState clone() {
    return BookState();
  }
}

class BookTabBarState extends BookState {}

class BookAppChangeCheekboxState extends BookState {}


class AppCreateDataBaseState extends BookState {}


class BookAppGetDataBaseState_tasks extends BookState {}
class BookAppGetDataBaseState_notes extends BookState {}
class BookAppGetDataBaseState_contacts extends BookState {}

class AppInsertDataBase_tasks_State extends BookState {}
class AppInsertDataBase_notes_State extends BookState {}
class AppInsertDataBase_contacts_State extends BookState {}

class AppUpdateDataBaseState extends BookState {}

class AppDeleteDataBaseState_tasks extends BookState {}
class AppDeleteDataBaseState_notes extends BookState {}
class AppDeleteDataBaseState_contacts extends BookState {}

class GetDataBaseLoadingState extends BookState {}
