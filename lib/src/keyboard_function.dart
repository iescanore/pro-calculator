typedef GetInputNumbers = void Function(String);

class KeyboardController {

  KeyboardController();

  String inputNumber = '0';

  final List<String> characters = [
    '+/-',
    '0',
    '.',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    'CE',
    'Remove',
  ];

  void showNumber(String keys) {

    if(keys == '+/-') {
      changeSign();
    } else if(keys == '.' && inputNumber.length < 11) {
      dot();
    } else if (keys == 'CE') {
      clearAll();
    } else if (keys == 'Remove') {
      clear();
    } else if(inputNumber.length < 12) {
      number(keys);
    }
  } 

  void changeSign() {
    if(!inputNumber.contains('-')){
      inputNumber = '-' + inputNumber;
    } else {
      inputNumber = inputNumber.substring(1, inputNumber.length);
    }
  }

  void clearAll() {
     inputNumber = '0';
  }

  void clear() {
    if(inputNumber.contains('-') && inputNumber.length == 2){
      inputNumber = inputNumber.substring(1, inputNumber.length - 1);
    } else if(inputNumber != '0'){
       inputNumber = inputNumber.substring(0, inputNumber.length - 1);
    }

    if(inputNumber.isEmpty) inputNumber = '0';
  }

  void dot() {
    assert(inputNumber.isNotEmpty);

    if(inputNumber.contains('.')){
       return;
    } else {
      inputNumber += '.';
    }
  }

  void number(String number) {
    if(inputNumber.startsWith('0') && !inputNumber.contains('0.')) inputNumber = ''; 
    if(inputNumber == '-0') inputNumber = '-';
    inputNumber += number;
  }
}