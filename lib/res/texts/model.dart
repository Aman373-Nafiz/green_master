class Text {
    
    Login login;
    Registration1 registration1;
    Registration2 registration2;
    Verification verification;

    Text({
      
        required this.login,
        required this.registration1,
        required this.registration2,
        required this.verification,
    });

}

class Login {
    String title;
    String buttonTitle;
    String endTitle1;
    String endTitle2;

    Login({
        required this.title,
        required this.buttonTitle,
        required this.endTitle1,
        required this.endTitle2,
    });

}

class Registration1 {
    String title;
    String subtitle;
    String buttonTitle;
    List<String> users;
    String endTitle1;
    String endTitle2;

    Registration1({
        required this.title,
        required this.subtitle,
        required this.buttonTitle,
        required this.users,
        required this.endTitle1,
        required this.endTitle2,
    });

}

class Registration2 {
    String title;
    String subtitle;
    String buttonTitle;

    Registration2({
        required this.title,
        required this.subtitle,
        required this.buttonTitle,
    });

}

class Verification {
    String title;
    String buttonTitle;

    Verification({
        required this.title,
        required this.buttonTitle,
    });

}
