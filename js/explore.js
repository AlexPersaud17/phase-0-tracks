// Pass a string through a function
// Have a new variable that takes letters from the phrase starting from right to left
// Displays the variable

function reverse(phrase){
	var reversedPhrase = "";
	for(var letter = (phrase.length - 1); letter >=0; letter--){
		reversedPhrase += phrase[letter];
	}
	return reversedPhrase;
}
var newPhrase = reverse("Hello, my name is Alex.");
var alex = "cool";
if(alex == "cool"){
	console.log(newPhrase);
}

