
    function PalindromeTwo(str) { 

  // code goes here  
  let myPal = "";
  let palCount = str.length;

  for(let index = 0;index<str.length;index++){
    palCount-=1;
    myPal = myPal+str[palCount];
    
    if(index == (str.length-1)){
      if(str.toLowerCase().trim().replace(/\s+/g, "").replace("á", "a").replace("é", "e").replace("í", "i").replace("ó", "o").replace("ú", "u") 
      == myPal.toLowerCase().trim().replace(/\s+/g, "").replace("á", "a").replace("é", "e").replace("í", "i").replace("ó", "o").replace("ú", "u"))
      {
        return true;
      }else{
        return false;
      }
    }
  }
  return str; 

}
   
// keep this function call here 
console.log(PalindromeTwo(readline()));

function Division(num1,num2) { 

  // code goes here  
  if(!num2){
    return num1;
  }
  return Division(num2, num1 % num2); 

}
   
// keep this function call here 
console.log(Division(readline()));
    
    /**/