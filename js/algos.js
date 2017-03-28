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


