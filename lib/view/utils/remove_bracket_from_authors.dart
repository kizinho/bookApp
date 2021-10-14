removeBracket(value){
 if(value == null){
  return 'unknown';
 }
 final string = value.join(',');
 return string;
}