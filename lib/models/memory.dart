class Memory{
  String _value = '0';

  static const operations = const ['%','X','-','=','+', '/'];

  final _buffer = [0.0, 0.0 ];
  int _bufferIndex = 0;
  late String? _operation ;
  bool _wipeValue = false;


  void applyCommand(String command){
    if(command == 'AC'){
      _allclear();
    }
    else if (command == 'CL'){
      _clearLast();
    }
    else if(operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigito(command);
    }

  }

  _addDigito(String digito){

    final  bool isDot = (digito == '.');
    final wipeValue = (_value == '0' && !isDot) || _wipeValue == true;

    if(isDot && _value.contains==0 && !wipeValue){
      return ;
    }


    final valorAtual = wipeValue ? '' : _value;
    _value = valorAtual + digito;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    print(_buffer);
  }

  _allclear(){
    _value = '0';
    _limparBuffer();
  }


  _limparBuffer(){
    _buffer.setAll(0, [0.0 , 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _wipeValue = false;

  }

  String _clearLast(){
    if(_value.length == 1){
      return _value = '0' ;
    }
    return _value = _value.substring(0, (_value.length - 1));
  }

  _setOperation(String newOP){
    if(_bufferIndex == 0){
      _operation = newOP;
      _bufferIndex = 1;
    }else{
      _buffer[0] = _calcular();
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.0')[0] : _value;
      _buffer[1] = 0;

      bool isEqual = (newOP == '=');
      _operation = isEqual ? null : newOP ;
      _bufferIndex = isEqual ? 0 : 1;


    }

    _wipeValue = true;
  }

  //retorna o valor para a tela
  String get value {
    return _value;
  }

  _calcular(){
    switch(_operation) {

      case '+':return (_buffer[0] + _buffer[1]);

      case '-':return (_buffer[0] - _buffer[1]);

      case 'X':return (_buffer[0] * _buffer[1]);

      case '/':return (_buffer[0] / _buffer[1]);

      case '%':return (_buffer[0] % _buffer[1]);

    }
  }
}