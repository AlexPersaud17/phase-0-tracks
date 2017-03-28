// Release 0
// Check the length of each word in the list
// Have a variable that stores the first word in the list
// 	If following word has more letters, update the variable to store that new word
// 	If not, test the word after
// Longest word should be stored in variable
// Display that variable

var phrases1 = ["long phrase","longest phrase","longer phrase", "phrase"];
var phrases2 = ["super", "cali", "fragilistic", "expi", "ali", "docious"];
var phrases3 = ["anti", "disestablishment", "arianism"]

function longPhraseChecker (phraseArray){
	var longestPhrase;
	var phraseLength = 0;
	for(var index = 0; index < phraseArray.length; index++){
		if(phraseArray[index].length > phraseLength){
			longestPhrase = phraseArray[index];
			phraseLength = phraseArray[index].length;
		}
	}
	return longestPhrase
}

// console.log(longPhraseChecker(phrases1));
// console.log(longPhraseChecker(phrases2));
// console.log(longPhraseChecker(phrases3));


// Release 1
// Create a list of the keys in the objects
// Test the same key of each object to see if they store the same value
// If so, display true

function matching(object1, object2){
	var objectKeys = [];
	for(var keys in object1){ objectKeys.push(keys) }

	for(var i = 0; i < objectKeys.length; i++){
		if(object1[objectKeys[i]] == object2[objectKeys[i]]){
			return true
		}
	}
}

// keyValue1 = {name: "Steven", age: 54}
// keyValue2 = {name: "Tamir", age: 54}
// console.log(matching(keyValue1, keyValue2));

function randomWordCreator(wordCount){
	randomWords = [];
	for(var count = 1; count <= wordCount; count++){
		var randWord = "";
		var allChars = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
		var letter;
		var howManyLetters = 10;
		var randLetterCount = Math.floor((Math.random() * howManyLetters) + 1);

		for(letter = 1; letter <= randLetterCount; letter++){
			randWord += allChars[(Math.floor(Math.random() * allChars.length))];
		}
		randomWords.push(randWord);
	}
	return randomWords;

}
var howManyWords = 10
console.log(randomWordCreator(howManyWords));
console.log("\nThe longest word in this array is '" + longPhraseChecker(randomWords) + "'.");

