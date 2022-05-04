
import '../shared/globals.dart' as globals;

Map<String, String> userContent = {
  'home_title': 'Activito',
  'home_view': 'History',
  'home_add_records': 'Save',
  'home_add_types': 'Create'
};

Map<String, String> devContent = {
  'home_title': 'History Logging',
  'home_view': 'View List',
  'home_add_records': 'Add Records',
  'home_add_types': 'Record Types'
};

Map<String, String> currentContent = userContent;

Map<String, String> getCurrentContent() {
  return currentContent;
}

void setCurrentContent(bool input) {
  if(input) {
    currentContent = devContent;
  } else {
    currentContent = userContent;
  }
  globals.homeUpdate();
}