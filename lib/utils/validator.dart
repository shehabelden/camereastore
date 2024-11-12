class MainValidator{
  static usernameValid (String v) {
    if (v.isEmpty) {
      return "field is empty";
    }
    if (v.length < 3) {
      return "user name is to short";
    }
    if( v.length > 20){
      return "user is to long";
    }
    // Check for allowed characters (alphanumeric and underscores)
    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegExp.hasMatch(v)) {
      return "name doesn't correct";
    }
  }
  static emailValid(v) {
    if (v.isEmpty) {
      return "field is empty";
    }
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if(!emailRegExp.hasMatch(v)){
      return "email doesn't correct";
    }
  }
  static phoneValid(v) {
    if (v.isEmpty) {
      return "field is empty";
    }
    final RegExp phoneRegExp = RegExp(
      r'^\+?[0-9]{10,15}$',
    );
    if(!phoneRegExp.hasMatch(v)){
      return "phone doesn't correct";
    }
  }
  static password(value){
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null; // Valid password
  }

}
