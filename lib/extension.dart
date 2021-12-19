extension RoundDigits on num {

  String toRound() {

  String inputNumber = this.toString();
  List<String> splitedNumber = inputNumber.contains('.') ? inputNumber.split('.') : [inputNumber];
   
     if(inputNumber.contains('.0') && splitedNumber[1].length == 1){
       return this.toInt().toString();
     } else if(inputNumber.length > 12) {
        if(splitedNumber[0].length >= 12) { 
          return this.toStringAsPrecision(11); 
        } else {
          return this.toStringAsFixed(11 - splitedNumber[0].length);
        }      
     } else {
       return inputNumber;
     }
  }
}

extension UsefullExtension on String {

  bool endswithList(Iterable<String> list) => list.any((element) => this.endsWith(element));

  bool containsList(Iterable<String> list) => list.any((element) => this.contains(element));

  num toNum() {
    if(num.tryParse(this) == null) throw FormatException();
    return num.tryParse(this)!;
  }

}